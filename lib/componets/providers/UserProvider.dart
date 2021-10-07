import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String areaname = '', guardname = '';

  String get getambulaceno => areaname;
  String get getguardname => guardname;

  void setareaname(String s) {
    areaname = s;
    notifyListeners();
  }

  void setguardname(String s) {
    guardname = s;
    notifyListeners();
  }
}
