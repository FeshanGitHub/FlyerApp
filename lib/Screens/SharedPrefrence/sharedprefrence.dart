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
Future setEmail(String email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
}

Future<String?> getEmail() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}
Future removeEmail() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove('email');
}
Future setDisplayPicture(String displayPicture) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('displayPicture', displayPicture);
}

Future<String?> getDisplayPicture() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('displayPicture');
}
Future removeDisplayPicture() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove('drivingLicense');
}
Future setDrivingLicense(String drivingLicense) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('drivingLicense', drivingLicense);
}

Future<String?> getDrivingLicense() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('drivingLicense');
}
Future removeDrivingLicense() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove('drivingLicense');
}
Future setPhoneNumber(String phoneNumber) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('phoneNumber', phoneNumber);
}

Future getPhoneNumber() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('phoneNumber');
}
Future setPassword(String password) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('password', password);
}

Future getPassword() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('setPassword');
}