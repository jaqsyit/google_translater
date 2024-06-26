import 'package:shared_preferences/shared_preferences.dart';

class RepoSettings {
  SharedPreferences? prefs;

  Future<void> init() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveLocale(String locale) async {
    if (prefs == null) return false;
    return prefs?.setString('locale', locale);
  }

  Future<String?> readLocale() async {
    if (prefs == null) return 'en';
    return prefs?.getString('locale');
  }

  Future<bool?> saveTheme(bool themeMod) async {
    if (prefs == null) return false;
    return prefs?.setBool('themeMod', themeMod);
  }

  Future<bool?> readTheme() async {
    if (prefs == null) return false;
    return prefs?.getBool('themeMod');
  }
}
