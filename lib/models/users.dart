import 'package:rest_api/models/login_details.dart';
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
  final LoginDetails loginDetails;
  User({
    required this.gender,
    required this.phone,
    required this.cell,
    required this.email,
    required this.nat,
    required this.name,
    required this.location,
    required this.loginDetails,
  });

  String get fullname {
    return '${name.title} ${name.first} ${name.last}';
  }
}
