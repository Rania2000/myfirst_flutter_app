import 'package:shared_preferences/shared_preferences.dart';

saveAccessTokenSharedPref(String token,String refreshToken,String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('refresh_token', refreshToken);
  await prefs.setString('id', id);
}

getUserInfoSharedPref(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString(key));
  return prefs.getString(key);
}

deleteToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}
