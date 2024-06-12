import 'package:teledartgame/utils/constants/callback_data_names.dart';
import 'package:teledartgame/service/extension_language_service.dart';
import 'package:teledart/model.dart';

class Games {
  static InlineKeyboardMarkup menu() {
    return InlineKeyboardMarkup(
      inlineKeyboard: <List<InlineKeyboardButton>>[
        [
          InlineKeyboardButton(
            text: "findNumber",
            callbackData: CallbackData.findNumber,
          )
        ],
        [
          InlineKeyboardButton(
            text: "back".translate,
            callbackData: CallbackData.homeMenu,
          )
        ]
      ],
    );
  }
}
