#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <windows.h>

#include <map>
#include <memory>
#include <sstream>
#include <string>

namespace {

class CountryCodesPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar) {
    auto channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
        registrar->messenger(), "country_codes",
        &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<CountryCodesPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto& call, auto result) {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  CountryCodesPlugin() {}

  virtual ~CountryCodesPlugin() {}

 private:
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
    if (method_call.method_name() == "getLocale") {
      const auto* arguments = std::get_if<std::string>(method_call.arguments());
      std::string locale_tag = arguments ? *arguments : GetSystemLocale();
      
      flutter::EncodableList locale_info{
        flutter::EncodableValue(GetSystemLanguage()),
        flutter::EncodableValue(GetSystemRegion()),
        flutter::EncodableValue(GetLocalizedCountryNames())
      };
      
      result->Success(flutter::EncodableValue(locale_info));
    } else if (method_call.method_name() == "getRegion") {
      std::string region = GetSystemRegion();
      result->Success(flutter::EncodableValue(region));
    } else if (method_call.method_name() == "getLanguage") {
      std::string language = GetSystemLanguage();
      result->Success(flutter::EncodableValue(language));
    } else {
      result->NotImplemented();
    }
  }

  std::string GetSystemLocale() {
    wchar_t locale_name[LOCALE_NAME_MAX_LENGTH];
    if (GetUserDefaultLocaleName(locale_name, LOCALE_NAME_MAX_LENGTH)) {
      return WideToUtf8(locale_name);
    }
    return "en-US"; // fallback
  }

  std::string GetSystemLanguage() {
    wchar_t language[LOCALE_NAME_MAX_LENGTH];
    if (GetUserDefaultLocaleName(language, LOCALE_NAME_MAX_LENGTH)) {
      std::wstring wide_lang(language);
      size_t separator = wide_lang.find(L'-');
      if (separator != std::wstring::npos) {
        wide_lang = wide_lang.substr(0, separator);
      }
      return WideToUtf8(wide_lang.c_str());
    }
    return "en"; // fallback
  }

  std::string GetSystemRegion() {
    wchar_t region[3];
    if (GetUserDefaultGeoName(region, 3)) {
      return WideToUtf8(region);
    }
    return "US"; // fallback
  }

  // Callback function for EnumSystemGeoNames
  static BOOL CALLBACK EnumGeoNamesProc(LPWSTR geoName, LPARAM param) {
    auto* country_names = reinterpret_cast<flutter::EncodableMap*>(param);
    
    wchar_t country_name[LOCALE_NAME_MAX_LENGTH];
    if (GetGeoInfoW(geoName, GEO_FRIENDLYNAME, country_name, LOCALE_NAME_MAX_LENGTH, 0)) {
      std::string utf8_code = WideToUtf8(geoName);
      std::string utf8_name = WideToUtf8(country_name);
      
      country_names->insert({
        flutter::EncodableValue(utf8_code),
        flutter::EncodableValue(utf8_name)
      });
    }
    return TRUE;
  }

  flutter::EncodableMap GetLocalizedCountryNames() {
    flutter::EncodableMap country_names;
    
    // Enumerate all geographical names
    EnumSystemGeoNames(GEOCLASS_NATION, 
                      EnumGeoNamesProc, 
                      reinterpret_cast<LPARAM>(&country_names));

    return country_names;
  }

  // Helper functions for string conversion
  static std::string WideToUtf8(const wchar_t* wide_str) {
    if (!wide_str) return std::string();
    
    int size = WideCharToMultiByte(CP_UTF8, 0, wide_str, -1, nullptr, 0, nullptr, nullptr);
    if (size <= 0) return std::string();
    
    std::string utf8_str(size - 1, 0);
    WideCharToMultiByte(CP_UTF8, 0, wide_str, -1, &utf8_str[0], size, nullptr, nullptr);
    return utf8_str;
  }
};

}  // namespace

void CountryCodesPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  CountryCodesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
