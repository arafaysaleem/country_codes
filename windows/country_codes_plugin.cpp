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
        flutter::EncodableValue(GetLocalizedCountryNames(locale_tag))
      };
      
      result->Success(flutter::EncodableValue(locale_info));
    } else if (method_call.method_name() == "getRegion") {
      result->Success(flutter::EncodableValue(GetSystemRegion()));
    } else if (method_call.method_name() == "getLanguage") {
      result->Success(flutter::EncodableValue(GetSystemLanguage()));
    } else {
      result->NotImplemented();
    }
  }

  std::string GetSystemLocale() {
    wchar_t locale_name[LOCALE_NAME_MAX_LENGTH];
    int result = GetUserDefaultLocaleName(locale_name, LOCALE_NAME_MAX_LENGTH);
    return WideToUtf8(locale_name);
  }

  std::string GetSystemLanguage() {
    wchar_t language[LOCALE_NAME_MAX_LENGTH];
    int result = GetUserDefaultLocaleName(language, LOCALE_NAME_MAX_LENGTH);
    std::wstring wide_lang(language);
    size_t separator = wide_lang.find(L'-');
    if (separator != std::wstring::npos) {
      wide_lang = wide_lang.substr(0, separator);
    }
    return WideToUtf8(wide_lang.c_str());
  }

  std::string GetSystemRegion() {
    wchar_t region[LOCALE_NAME_MAX_LENGTH];
    int result = GetUserDefaultGeoName(region, LOCALE_NAME_MAX_LENGTH);
    return WideToUtf8(region);
  }

  flutter::EncodableMap GetLocalizedCountryNames(const std::string& locale_tag) {
    flutter::EncodableMap country_names;
    wchar_t buffer[LOCALE_NAME_MAX_LENGTH];
    
    // Convert locale_tag to wide string
    std::wstring wide_locale = Utf8ToWide(locale_tag);
    
    // Get all geographic regions
    EnumSystemGeoID(GEOCLASS_NATION, 0, [](GEOID geoId, LPARAM param) -> BOOL {
      auto map_ptr = reinterpret_cast<flutter::EncodableMap*>(param);
      wchar_t country_code[3];
      wchar_t country_name[LOCALE_NAME_MAX_LENGTH];
      
      if (GetGeoInfoW(geoId, GEO_ISO2, country_code, 3, 0) &&
          GetGeoInfoW(geoId, GEO_FRIENDLYNAME, country_name, LOCALE_NAME_MAX_LENGTH, 0)) {
        
        std::string utf8_code = WideToUtf8(country_code);
        std::string utf8_name = WideToUtf8(country_name);
        
        map_ptr->insert({
          flutter::EncodableValue(utf8_code),
          flutter::EncodableValue(utf8_name)
        });
      }
      return TRUE;
    }, reinterpret_cast<LPARAM>(&country_names));

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

  static std::wstring Utf8ToWide(const std::string& utf8_str) {
    if (utf8_str.empty()) return std::wstring();
    
    int size = MultiByteToWideChar(CP_UTF8, 0, utf8_str.c_str(), -1, nullptr, 0);
    if (size <= 0) return std::wstring();
    
    std::wstring wide_str(size - 1, 0);
    MultiByteToWideChar(CP_UTF8, 0, utf8_str.c_str(), -1, &wide_str[0], size);
    return wide_str;
  }
};

}  // namespace

void CountryCodesPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  CountryCodesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
