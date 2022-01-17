import 'package:flutter_meedu/flutter_meedu.dart';

class ThemeController extends SimpleNotifier {
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void changeTheme() {
    _darkTheme = !_darkTheme;
    notify();
  }
}
