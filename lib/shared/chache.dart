import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static late SharedPreferences cache;

  static init() async {
    cache = await SharedPreferences.getInstance();
  }

  static Future<bool> saveInt({
    required String key,
    required int value,
  }) async {
    return await cache.setInt(key, value);
  }

  static Future<bool> saveBool({
    required String key,
    required bool value,
  }) async {
    return await cache.setBool(key, value);
  }

  static Future<bool> saveDouble({
    required String key,
    required double value,
  }) async {
    return await cache.setDouble(key, value);
  }

  static Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    return await cache.setString(key, value);
  }

  static dynamic? get_cache({required String key}) {
    return cache.get(key);
  }

  static Future<bool> supp({required String key}) async {
    return await cache.remove(key);
  }

  static Future<bool> clearAll() async {
    return await cache.clear();
  }
}
