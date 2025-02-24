# File: windows/country_codes_plugin.h
#ifndef FLUTTER_PLUGIN_COUNTRY_CODES_PLUGIN_H_
#define FLUTTER_PLUGIN_COUNTRY_CODES_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace country_codes {

class CountryCodesPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CountryCodesPlugin();

  virtual ~CountryCodesPlugin();

  // Disallow copy and assign.
  CountryCodesPlugin(const CountryCodesPlugin&) = delete;
  CountryCodesPlugin& operator=(const CountryCodesPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace country_codes

#endif  // FLUTTER_PLUGIN_COUNTRY_CODES_PLUGIN_H_
