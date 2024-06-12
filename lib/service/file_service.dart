import 'dart:io';

import 'package:teledartgame/utils/constants/bot_steps.dart';

import '../models/user.dart';

class FileService {
  static const String adminFilePath = "./assets/json/admin.json";
  static const String userFilePath = "./assets/json/user.json";

  static Future<bool?> checkAndUpdateUser(String userFilePath, int chatId) async {
    try {
      File file = File(userFilePath);
      String userDataFromJsonAsString = await file.absolute.readAsString();
      List<UserData> userDataList = userDataFromJson(userDataFromJsonAsString);

      for (UserData element in userDataList) {
        if (element.chatId == chatId) {
          return true;
        }
      }

      UserData user = UserData();
      user.chatId = chatId;
      user.isBlock = false;
      user.step = BotSteps.start;
      userDataList.add(user);

      String userDataToJsonAsString = userDataToJson(userDataList);
      await file.writeAsString(userDataToJsonAsString);

      return false;
    } catch (error) {
      print(error);
    }
    return null;
  }

  static Future<UserData?> getUser(String path, int chatId) async {
    try {
      File file = File(path);
      String userDataFromJsonAsString = await file.absolute.readAsString();
      List<UserData> userDataList = userDataFromJson(userDataFromJsonAsString);

      for (UserData user in userDataList) {
        if (user.chatId == chatId) {
          return user;
        }
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  static Future<String?> postUser(String path, UserData user) async {
    try {
      File file = File(path);
      String userDataFromJsonAsString = await file.absolute.readAsString();
      List<UserData> userDataList = userDataFromJson(userDataFromJsonAsString);

      for (UserData element in userDataList) {
        if (element.chatId == user.chatId) {
          userDataList.removeAt(userDataList.indexOf(element));
          userDataList.add(user);
        }
      }

      String userDataToJsonAsString = userDataToJson(userDataList);

      await file.writeAsString(userDataToJsonAsString);

      return user.toString();
    } catch (error) {
      print(error);
    }
    return null;
  }
}
