import 'package:teledartgame/menu/home/home_screen.dart';
import 'package:teledartgame/menu/home/setting/setting_page/langauge/language_page/select_language.dart';
import 'package:teledartgame/menu/home/setting/setting_page/langauge/language_screen.dart';
import 'package:teledartgame/models/user.dart';
import 'package:teledartgame/service/extension_language_service.dart';
import 'package:teledartgame/service/file_service.dart';
import 'package:teledartgame/service/language_service.dart';
import 'package:teledartgame/service/network_service.dart';
import 'package:teledartgame/utils/constants/bot_commands.dart';
import 'package:teledartgame/utils/constants/bot_steps.dart';
import 'package:teledartgame/utils/constants/images.dart';
import 'package:teledartgame/utils/extensions/colors.dart';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

class TelegramBot {
  Future<void> build() async {
    final username = (await Telegram(NetworkService.botToken).getMe()).username;
    TeleDart bot = TeleDart(NetworkService.botToken, Event(username!));

    bot.start();

    bot.onMessage().listen((message) async {
      String? text = message.contact?.phoneNumber.toString();

      print(text);
    });

    bot.onCommand().listen((command) async {
      int chatId = command.chat.id;
      String? textCommand = command.text;
      UserData? user = await FileService.getUser(
        FileService.userFilePath,
        chatId,
      );

      if (user != null && user.isBlock == false) {
        /// -- /start -- buyrug'i
        if (textCommand == BotCommands.start) {
          bool? checkUser = await FileService.checkAndUpdateUser(
            FileService.userFilePath,
            chatId,
          );

          /// Telegram botni avvaldan ishlatib yurgan foydalanuvchilar
          if (checkUser == true) {
            /// Telegram botdan to'liq ro'yxatdan o'tgan foydalanuvchilar
            if (user.language != null) {
              LanguageService.chooseLanguage(user.language!);

              await command.reply("Xush kelibsiz, hurmatli ${user.username}");

              await bot.sendPhoto(
                chatId,
                Images.homeScreenImage,
                caption: "home_screen".translate,
                protectContent: true,
                replyMarkup: HomeScreen.menu(),
              );

              user.step = BotSteps.homeScreen;

              String? userAsString = await FileService.postUser(
                FileService.userFilePath,
                user,
              );

              print(userAsString?.lightGreen);
            }

            /// Telegram botdagi til tanlash qismini tanlamagan foydalanuvchilar
            else {
              bot.sendMessage(
                chatId,
                "language_null".translate,
                protectContent: true,
                replyMarkup: SelectLanguage.menu(),
              );

              user.step = BotSteps.selectLanguage;

              String? userAsString = await FileService.postUser(
                FileService.userFilePath,
                user,
              );

              print(userAsString?.lightGreen);
            }
          }

          /// Telegram botdan yangi ro'yxatdan o'tgan foydalanuvchilar
          if (checkUser == false) {}
        }
      }
    });

    bot.onCallbackQuery().listen((callbackQuery) async {
      int chatId = callbackQuery.message!.chat.id;
      String? dataCallback = callbackQuery.data;
      UserData? user = await FileService.getUser(
        FileService.userFilePath,
        chatId,
      );

      if (user != null && user.isBlock == false && dataCallback != null) {
        if (user.step == BotSteps.selectLanguage) {
          user = SelectLanguageFunction.selectLang(user, dataCallback);

          await bot.sendPhoto(
            chatId,
            Images.homeScreenImage,
            caption: "home_screen".translate,
            protectContent: true,
            replyMarkup: HomeScreen.menu(),
          );

          user.step = BotSteps.homeScreen;

          String? userAsString = await FileService.postUser(
            FileService.userFilePath,
            user,
          );

          print(userAsString?.lightGreen);
        }
      }
    });
  }
}
