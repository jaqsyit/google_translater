import 'package:hive/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 1)
class AppSettings {
  @HiveField(0)
  String locale;

  @HiveField(1)
  String theme;

  AppSettings(this.locale, this.theme);
}
