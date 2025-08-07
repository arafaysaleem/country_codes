package com.miguelruivo.flutter.plugin.countrycodes.country_codes

import android.R
import java.util.Locale
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** CountryCodesPlugin */
public class CountryCodesPlugin: FlutterPlugin, MethodCallHandler {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "country_codes")
    channel.setMethodCallHandler(CountryCodesPlugin());
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

    when (call.method) {
        "getLocale" -> result.success(listOf(Locale.getDefault().language, Locale.getDefault().country, getLocalizedCountryNames(call.arguments as String?)))
        "getRegion" -> result.success(Locale.getDefault().country)
        "getLanguage" -> result.success(Locale.getDefault().language)
        "getLanguageLocale" -> {
            val localeTag = call.arguments as? String
            val languageNames = getLocalizedLanguageNames(localeTag)
            val language = Locale.getDefault().language
            val region = Locale.getDefault().country
            result.success(listOf(language, region, languageNames))
        }
        else -> result.notImplemented()
    }
  }

  private fun getLocalizedCountryNames(localeTag: String?) : HashMap<String, String> {
    var localizedCountries: HashMap<String,String> = HashMap()
    val deviceCountry: String = Locale.getDefault().toLanguageTag();
    for (countryCode in Locale.getISOCountries()) {
      val locale = Locale(localeTag ?: deviceCountry,countryCode)
      var countryName: String? = locale.getDisplayCountry(Locale.forLanguageTag(localeTag ?: deviceCountry))
      localizedCountries[countryCode.toUpperCase()] = countryName ?: "";
    }
    return localizedCountries
  }

  private fun getLocalizedLanguageNames(localeTag: String?): HashMap<String, String> {
    val localizedLanguages = HashMap<String, String>()
    val deviceLanguage = Locale.getDefault().toLanguageTag()
    val targetLocale = Locale.forLanguageTag(localeTag ?: deviceLanguage)
    val availableLanguages = Locale.getISOLanguages()
    for (languageCode in availableLanguages) {
        val locale = Locale(languageCode)
        val languageName = locale.getDisplayLanguage(targetLocale)
        localizedLanguages[languageCode.uppercase()] = languageName ?: ""
    }
    return localizedLanguages
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
  }
}
