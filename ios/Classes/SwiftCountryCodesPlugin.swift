import Flutter
import UIKit

public class SwiftCountryCodesPlugin: NSObject, FlutterPlugin {
    // MARK: - Constants
    private enum Constants {
        static let channelName = "country_codes"
    }
    
    // MARK: - FlutterPlugin
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: Constants.channelName,
            binaryMessenger: registrar.messenger()
        )
        let instance = SwiftCountryCodesPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getRegion":
            result(Locale.current.regionCode)
            
        case "getLanguage":
            result(Locale.current.languageCode)
            
        case "getLocale":
            let localeInfo: [Any] = [
                Locale.current.languageCode as Any,
                Locale.current.regionCode as Any,
                getLocalizedCountryNames(localeTag: call.arguments as? String)
            ]
            result(localeInfo)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    // MARK: - Private Methods
    private func getLocalizedCountryNames(localeTag: String?) -> [String: String] {
        let preferredLocale = localeTag ?? Locale.preferredLanguages[0]
        let locale = NSLocale(localeIdentifier: preferredLocale)
        
        return Dictionary(uniqueKeysWithValues: NSLocale.isoCountryCodes.map { countryCode in
            let countryName = locale.displayName(forKey: .countryCode, value: countryCode)
            return (countryCode.uppercased(), countryName ?? "")
        })
    }
}
