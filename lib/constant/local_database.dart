import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static SharedPreferences sharedPreferences =
      SharedPreferences.getInstance().toString() as SharedPreferences;
}
