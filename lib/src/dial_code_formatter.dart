import 'package:country_codes/country_codes.dart';
import 'package:flutter/services.dart';

/// A formatter that dynamically adds the `dialCode` for the given [alpha2Code], 
/// [alpha3Code], [dialCode], [countryCode] as a prefix of the input text.
/// 
/// When not provided, the device's locale will be used instead.
/// 
/// This can be handy to use along with `TextFormFields` that are typically used
/// on phone numbers forms.
class DialCodeFormatter extends TextInputFormatter {
  late final String code;

  DialCodeFormatter({
    String? alpha2Code,
    String? alpha3Code,
    String? dialCode,
    String? countryCode,
  }) {
    if (dialCode != null) {
      code = dialCode;
    } else if (alpha2Code != null) {
      code = CountryCodes.getByAlpha2(alpha2Code)!.dialCode;
    } else if (alpha3Code != null) {
      code = CountryCodes.getByAlpha3(alpha3Code)!.dialCode;
    } else if (countryCode != null) {
      code = CountryCodes.getByCountryCode(countryCode)!.dialCode;
    } else {
      code = CountryCodes.countries.first.dialCode;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(code)) {
      return newValue;
    }

    final String text = newValue.text.contains('+') ? '' : newValue.text;
    return TextEditingValue(text: '$code$text');
  }
}
