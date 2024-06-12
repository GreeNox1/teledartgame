import 'package:teledartgame/service/extension_language_service.dart';
import 'package:teledartgame/utils/constants/callback_data_names.dart';
import 'package:teledart/model.dart';

class HomeScreen {
  static InlineKeyboardMarkup menu() {
    return InlineKeyboardMarkup(
      inlineKeyboard: <List<InlineKeyboardButton>>[
        [
          InlineKeyboardButton(
            text: "games".translate,
            callbackData: CallbackData.games,
          )
        ],
        [
          InlineKeyboardButton(
            text: "leaderBoard".translate,
            callbackData: CallbackData.leaderBoard,
          )
        ],
        [
          InlineKeyboardButton(
            text: "settingMenu".translate,
            callbackData: CallbackData.settingMenu,
          )
        ],
        [
          InlineKeyboardButton(
            text: "userInfo".translate,
            callbackData: CallbackData.userInfo,
          )
        ],
        [
          InlineKeyboardButton(
            text: "botInfo".translate,
            callbackData: CallbackData.botInfo,
          )
        ],
      ],
    );
  }
}
