import 'dart:convert';

List<AdminData> adminDataFromJson(String data) => List<AdminData>.from(
    jsonDecode(data).map((element) => AdminData.fromJson(element)));

String userDataToJson(List<AdminData> userData) =>
    jsonEncode(userData.map((element) => element.toJson()));

class AdminData {
  int? chatId;
  String? username;
  String? phoneNumber;
  bool? isBlock;
  String? step;

  AdminData();

  AdminData.fromJson(Map<String, dynamic> json) {
    chatId = json["chatId"];
    username = json["username"];
    phoneNumber = json["phoneNumber"];
    isBlock = json["isBlock"];
    step = json["step"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "chatId": chatId,
      "username": username,
      "phoneNumber": phoneNumber,
      "isBlock": isBlock,
      "step": step
    };
    return map;
  }

  @override
  String toString() {
    return "Chat Id: $chatId\n"
        "Username: $username\n"
        "Phone number: $phoneNumber\n"
        "Is Block: $isBlock\n"
        "Step: $step";
  }
}
