import 'package:shared_preferences/shared_preferences.dart';

class cachehHlper {
static late SharedPreferences sharPreferences ;
 static init() async
  {
     sharPreferences =await SharedPreferences.getInstance();
  } 
  static Future<bool> putshare(
    {
      required String key,
      required bool value,
    }
  )
  {
   return sharPreferences.setBool(key, value);
  }
  
  static bool? getshare({
    required String key,
  })
  {
     return sharPreferences.getBool(key);
  }
}