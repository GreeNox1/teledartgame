enum Language {
  eng,
  uzb,
  rus,
}

class LanguageService {
  static Language language = Language.eng;

  static String languageSaved = language.name.toString();

  /// Function to set the selected language in LanguageService based
  /// on the provided language code.
  /// Defaults to English if the provided language code is not recognized.
  static chooseLanguage(String lang) {
    switch (lang) {
      case "uzb":
        LanguageService.language = Language.uzb;
        break;
      case "rus":
        LanguageService.language = Language.rus;
        break;
      case "eng":
        LanguageService.language = Language.eng;
        break;
      default:
        LanguageService.language = Language.eng;
        break;
    }
  }
}
