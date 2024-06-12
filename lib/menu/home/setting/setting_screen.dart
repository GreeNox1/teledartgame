import 'package:teledartgame/service/extension_language_service.dart';
import 'package:teledart/model.dart';

class SettingScreen {
  InlineKeyboardMarkup menu() {
    return InlineKeyboardMarkup(
      inlineKeyboard: <List<InlineKeyboardButton>>[
        [
          InlineKeyboardButton(text: "language".translate, callbackData: "language"),
        ],
      ],
    );
  }
}
