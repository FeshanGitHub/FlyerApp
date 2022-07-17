import 'package:shared_preferences/shared_preferences.dart';



Future setToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}
Future setId(String id) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('Id', id);
}

Future<String?> getId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('Id');
}
Future setName(String name) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
}

Future<String?> getName() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('name');
}