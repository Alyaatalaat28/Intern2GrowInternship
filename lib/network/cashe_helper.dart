import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences?sharedpreferences;
  static init()async {
    sharedpreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> saveData({required String key,required String value}) async {
    return await sharedpreferences!.setString(key, value);
  }

   static String?  getData({required String key}){
    return sharedpreferences!.getString(key);
   }
   
   static Future<bool> removeData(String key)async{
    return await sharedpreferences!.remove(key);
   }

  }