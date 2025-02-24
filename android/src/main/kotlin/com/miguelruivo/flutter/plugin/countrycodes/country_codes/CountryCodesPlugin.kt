package com.miguelruivo.flutter.plugin.countrycodes.country_codes

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.Locale

class CountryCodesPlugin : FlutterPlugin, MethodCallHandler {
    private var channel: MethodChannel? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, CHANNEL_NAME).apply {
            setMethodCallHandler(this@CountryCodesPlugin)
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getLocale" -> {
                val localeInfo = listOf(
                    Locale.getDefault().language,
                    Locale.getDefault().country,
                    getLocalizedCountryNames(call.arguments as? String)
                )
                result.success(localeInfo)
            }
            "getRegion" -> result.success(Locale.getDefault().country)
            "getLanguage" -> result.success(Locale.getDefault().language)
            else -> result.notImplemented()
        }
    }

    private fun getLocalizedCountryNames(localeTag: String?): Map<String, String> {
        val deviceCountry = Locale.getDefault().toLanguageTag()
        val targetLocale = Locale.forLanguageTag(localeTag ?: deviceCountry)
        
        return Locale.getISOCountries().associate { countryCode ->
            val locale = Locale("", countryCode)
            val countryName = locale.getDisplayCountry(targetLocale)
            countryCode.uppercase() to (countryName.ifEmpty { "" })
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
    }

    companion object {
        private const val CHANNEL_NAME = "country_codes"
    }
}
