import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/login_details.dart';
import 'package:rest_api/models/user_location.dart';
import 'package:rest_api/models/user_name.dart';
import 'package:rest_api/models/users.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        first: e['name']['first'],
        title: e['name']['title'],
        last: e['name']['last'],
      );
      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        timezone: e['location']['timezone']['offset'],
      );
      final logindetails = LoginDetails(
        password: e['login']['password'],
        username: e['login']['username'],
        salt: e['login']['salt'],
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        location: location,
        loginDetails: logindetails,
      );
    }).toList();
    return users;
  }
}
