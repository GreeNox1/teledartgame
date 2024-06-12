extension Colors on String {
  String get black => "\x1B[30m$this\x1B[0m";
  String get lightRed => "\x1B[31m$this\x1B[0m";
  String get lightGreen => "\x1B[32m$this\x1B[0m";
  String get lightYellow => "\x1B[33m$this\x1B[0m";
  String get lightBlue => "\x1B[34m$this\x1B[0m";
  String get magenta => "\x1B[35m$this\x1B[0m";
  String get cyan => "\x1B[36m$this\x1B[0m";
  String get grey => "\x1B[37m$this\x1B[0m";

  String get white => "\x1B[38;2;255;255;255m$this\x1B[0m";

  String get backBlack => "\x1B[40m$this\x1B[0m";
  String get backRed => "\x1B[41m$this\x1B[0m";
  String get backGreen => "\x1B[42m$this\x1B[0m";
  String get backYellow => "\x1B[43m$this\x1B[0m";
  String get backBlue => "\x1B[44m$this\x1B[0m";
  String get backMagenta => "\x1B[45m$this\x1B[0m";
  String get backCyan => "\x1B[46m$this\x1B[0m";
  String get backGrey => "\x1B[47m$this\x1B[0m";

  String get backWhite => "\x1B[48;2;255;255;255m$this\x1B[0m";
}
