import 'dart:convert';

List<UserData> userDataFromJson(String data) =>
    List<UserData>.from(jsonDecode(data).map(
      (element) => UserData.fromJson(element),
    ));

String userDataToJson(List<UserData> userData) => jsonEncode(userData);

class UserData {
  int? chatId;
  String? username;
  bool? isBlock;
  String? language;
  String? step;

  UserData({
    this.chatId,
    this.username,
    this.isBlock,
    this.language,
    this.step,
  });

  factory UserData.fromJson(Map<String, Object?> json) {
    return UserData(
      chatId: json["chatId"] as int?,
      username: json["username"] as String?,
      isBlock: json["isBlock"] as bool?,
      language: json["language"] as String?,
      step: json["step"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "chatId": chatId,
      "username": username,
      "isBlock": isBlock,
      "language": language,
      "step": step
    };
  }

  @override
  int get hashCode => Object.hash(chatId, username, isBlock, language, step);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserData &&
          runtimeType == other.runtimeType &&
          chatId == other.chatId &&
          username == other.username &&
          isBlock == other.isBlock &&
          language == other.language &&
          step == other.step;

  @override
  String toString() {
    return "UserData(chatId: $chatId, "
        "username: $username, "
        "isBlock: $isBlock, "
        "language: $language, "
        "step: $step)";
  }
}
