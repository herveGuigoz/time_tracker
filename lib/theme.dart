import 'dart:ui';

abstract class AppColors {
  static const Color blue = Color.fromRGBO(67, 81, 117, 1);
  static const Color green = Color.fromRGBO(27, 177, 178, 1);
  static const Color red = Color.fromRGBO(255, 92, 92, 1);
  static const Color white = Color(0xFFF9F9F9);
  static const Color gray = Color.fromRGBO(145, 161, 174, 1);
}

abstract class AppDurations {
  static const slow = Duration(milliseconds: 250);
}

class Asset {
  const Asset(this.name, this.path);

  final String name;
  final String path;
}

abstract class Assets {
  static const Asset home = Asset('home', 'assets/home.png');
  static const Asset coding = Asset('coding', 'assets/coding.png');
  static const Asset off = Asset('off', 'assets/off.png');
}
