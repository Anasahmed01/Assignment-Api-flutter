import 'dart:convert';
import 'package:assignmentapi/model.dart';
import 'package:http/http.dart' as http;

getuser() async {
  var url = Uri.parse('https://maaz-api.tga-edu.com/api/users');
  var response = await http.get(url);
  var responseData = jsonDecode(response.body);
  return HomeModel.fromJson(responseData);
}

deleteUser({required int id}) {
  return http.post(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

addUser(Data model) async {
  await http.post(
    Uri.parse("https://maaz-api.tga-edu.com/api/users"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(model.toJson()),
  );
}

updateUser({required Data model, required int id}) async {
  await http.put(
    Uri.parse("https://maaz-api.tga-edu.com/api/users/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(model.toJson()),
  );
}
