# File: windows/include/country_codes/country_codes_plugin_c_api.h
#ifndef FLUTTER_PLUGIN_COUNTRY_CODES_PLUGIN_C_API_H_
#define FLUTTER_PLUGIN_COUNTRY_CODES_PLUGIN_C_API_H_

#include <flutter_plugin_registrar.h>

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FLUTTER_PLUGIN_EXPORT __declspec(dllimport)
#endif

#if defined(__cplusplus)
extern "C" {
#endif

FLUTTER_PLUGIN_EXPORT void CountryCodesPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar);

#if defined(__cplusplus)
}  // extern "C"
#endif

#endif  // FLUTTER_PLUGIN_COUNTRY_CODES_PLUGIN_C_API_H_
