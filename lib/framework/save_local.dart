import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static void save({required String key, required var value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('save!');
    print(prefs);
    print(value);

    if (value is Set) {
      value = value.toList();
    }
    String json = jsonEncode(value);

    var result = await prefs.setString(key, json);
    print(result);
  }

  static Future<dynamic> load({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('load!');
    print(prefs);
    String json = prefs.getString(key) ?? '';
    var value = jsonDecode(json);
    print(value);
    return await value;
  }
}
