import 'package:shared_preferences/shared_preferences.dart';

class DataUrl {
  Future saveLocalData(String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('key', value);
  }

  Future<String> getLocalUrl() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('key') ?? '';
  }
}