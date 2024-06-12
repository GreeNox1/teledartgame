import '../service/language_service.dart';
import 'locals/eng_language.dart';
import 'locals/rus_language.dart';
import 'locals/uzb_language.dart';

extension LanuageExtension on String {

  /// Extension method to translate a string.dart based on the current language set in LanguageService.
  /// Returns the translated string.dart if available, otherwise returns the original string.dart.
  String get translate {
    switch (LanguageService.language) {
      case Language.uzb:
        {
          return uzb[this] ?? this;
        }
      case Language.rus:
        {
          return rus[this] ?? this;
        }
      case Language.eng:
        {
          return eng[this] ?? this;
        }
    }
  }
}
