import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
   static late SharedPreferences sharedPreferences;
  static init()async
  {
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static putBool(key,value)
  {
    sharedPreferences.setBool(key, value);
  }
  static getkey(key)
  {
     sharedPreferences.get(key)?? false ;
  }
}