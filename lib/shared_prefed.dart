import 'package:shared_preferences/shared_preferences.dart';

Future<void> isUserLoggIn(bool isLog) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isUserLoggIn", isLog);
  print('data stored successfully');
}

Future<bool> isGetingData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isGetData = prefs.getBool('isUserLoggIn');
  if (isGetData == null) {
    isGetData = false;
  }
  print(isGetData);
  return isGetData;
}

Future<void> isRemoved() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("isUserLoggIn");
}
