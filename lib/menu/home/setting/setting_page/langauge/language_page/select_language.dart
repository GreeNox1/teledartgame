import 'package:teledartgame/utils/constants/callback_data_names.dart';

import '../../../../../../models/user.dart';
import '../../../../../../service/language_service.dart';

class SelectLanguageFunction {
  /// Function to set the selected language in LanguageService and update
  /// the user's language preference.
  /// Returns the updated user data.
  static UserData selectLang(UserData user, String data) {
    switch (data) {
      case CallbackData.languageUzb:
        LanguageService.language = Language.uzb;
        break;
      case CallbackData.languageRus:
        LanguageService.language = Language.rus;
        break;
      case CallbackData.languageEng:
        LanguageService.language = Language.eng;
        break;
    }

    user.language = LanguageService.languageSaved;

    return user;
  }
}
