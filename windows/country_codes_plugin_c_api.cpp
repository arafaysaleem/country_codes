# File: windows/country_codes_plugin_c_api.cpp
#include "include/country_codes/country_codes_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "country_codes_plugin.h"

void CountryCodesPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  country_codes::CountryCodesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
