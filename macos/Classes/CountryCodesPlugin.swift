import Cocoa
import FlutterMacOS

public class CountryCodesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "country_codes", binaryMessenger: registrar.messenger)
    let instance = CountryCodesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getRegion":
        result(Locale.current.regionCode)
        break
    case "getLanguage":
        result(Locale.current.languageCode)
        break
    case "getLocale":
        result([Locale.current.languageCode as Any, Locale.current.regionCode as Any, getLocalizedCountryNames(localeTag: call.arguments as? String)])
        break
    case "getLanguageLocale":
        let localeTag = call.arguments as? String
        let languageNames = getLocalizedLanguageNames(localeTag: localeTag)
        let language = Locale.current.languageCode ?? "en"
        let region = Locale.current.regionCode ?? "US"
        result([language, region, languageNames])
        break
    default:
        result(FlutterMethodNotImplemented);
    }
  }
  
  func getLocalizedCountryNames(localeTag: String?) -> Dictionary<String,String> {
      var localizedCountries:Dictionary<String,String> = [String: String]()
      for countryCode in NSLocale.isoCountryCodes {
          let countryName: String? = NSLocale(localeIdentifier: localeTag ?? Locale.preferredLanguages[0]).displayName(forKey: .countryCode, value: countryCode)
          localizedCountries[countryCode.uppercased()] = countryName ?? "";
      }
      return localizedCountries
  }

  private func getLocalizedLanguageNames(localeTag: String?) -> [String: String] {
      var localizedLanguages: [String: String] = [:]
      let availableLanguages = Locale.availableIdentifiers.compactMap { Locale(identifier: $0).languageCode }.removingDuplicates()
      for languageCode in availableLanguages {
          let languageName = NSLocale(localeIdentifier: localeTag ?? Locale.preferredLanguages[0]).displayName(forKey: .languageCode, value: languageCode)
          localizedLanguages[languageCode.uppercased()] = languageName ?? ""
      }
      return localizedLanguages
  }

// Extension to remove duplicates
extension Sequence where Iterator.Element: Hashable {
    func removingDuplicates() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
}