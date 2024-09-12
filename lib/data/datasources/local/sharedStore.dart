import 'dart:async' show Future;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userName = "userName";
const firstRun = "firstRun";
const userToken = "USER_TOKEN";

class SharedStore {
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    if (_prefsInstance != null) {
      return _prefsInstance!;
    } else {
      _prefsInstance = await SharedPreferences.getInstance();
      return _prefsInstance!;
    }
  }

  static Box _getBox(){
    return Hive.box(userToken);
  }

  static String getString(String key, [String defValue = ""]) {
    return _prefsInstance!.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) async {
    return await _prefsInstance!.setString(key, value);
  }

  static bool getBool(String key, [bool defValue = false]) {
    return _prefsInstance!.getBool(key) ?? defValue;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefsInstance!.setBool(key, value);
  }

  static String getUserName([String defValue = ""]) {
    return getString(userName, defValue);
  }

  static Future<bool> setUserName(String value) {
    return setString(userName, value);
  }

  static bool isFirstRun([bool defValue = false]) {
    return getBool(firstRun, defValue);
  }

  static Future<bool> setFirstRun(bool value) {
    return setBool(firstRun, value);
  }

  static void setUserToken(String value) => _getBox().put(userToken, value);

  static String getUserToken() => _getBox().get(userToken, defaultValue: "");

  static clearAll() async{
    await _prefsInstance?.clear();
  }

}
