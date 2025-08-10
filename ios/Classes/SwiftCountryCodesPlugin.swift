import Flutter
import UIKit

public class SwiftCountryCodesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "country_codes", binaryMessenger: registrar.messenger())
    let instance = SwiftCountryCodesPlugin()
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
    case "sortByLocalized":
        if let args = call.arguments as? [String: Any],
           let names = args["names"] as? [String],
           let ascending = args["ascending"] as? Bool {
            let localeTag = args["localeTag"] as? String
            result(sortByLocalized(names: names, localeTag: localeTag, ascending: ascending))
        } else {
            result([])
        }
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

    func sortByLocalized(names: [String], localeTag: String?, ascending: Bool) -> [String] {
        let locale = localeTag != nil ? Locale(identifier: localeTag!) : Locale.current
        let sorted = names.sorted { $0.compare($1, locale: locale) == .orderedAscending }
        return ascending ? sorted : sorted.reversed()
    }
}

// Extension to remove duplicates
extension Sequence where Iterator.Element: Hashable {
    func removingDuplicates() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
