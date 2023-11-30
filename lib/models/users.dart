import 'package:rest_api/models/user_dob.dart';
import 'package:rest_api/models/user_location.dart';
import 'package:rest_api/models/user_name.dart';

class User {
  final String gender;
  final String phone;
  final String cell;
  final String email;
  final String nat;
  final UserName name;
  final UserLocation location;
  final UserDob dob;
  User({
    required this.gender,
    required this.phone,
    required this.cell,
    required this.email,
    required this.nat,
    required this.name,
    required this.location,
    required this.dob,
  });

  String get fullname {
    return '${name.title} ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final location = UserLocation.fromMap(e['location']);
    final dob = UserDob.fromMap(e['dob']);

    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
    );
  }
}
