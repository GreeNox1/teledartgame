import 'package:teledart/model.dart';

import '../../../../../utils/constants/callback_data_names.dart';

class SelectLanguage {
  static InlineKeyboardMarkup menu() {
    return InlineKeyboardMarkup(
      inlineKeyboard: <List<InlineKeyboardButton>>[
        [
          InlineKeyboardButton(
            text: "Uzb 🇺🇿",
            callbackData: CallbackData.languageUzb,
          ),
          InlineKeyboardButton(
            text: "Rus 🇷🇺",
            callbackData: CallbackData.languageRus,
          ),
          InlineKeyboardButton(
            text: "Eng 🇺🇸",
            callbackData: CallbackData.languageEng,
          )
        ]
      ],
    );
  }
}
