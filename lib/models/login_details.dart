class LoginDetails {
  final String username;
  final String password;
  final String salt;

  LoginDetails({
    required this.password,
    required this.username,
    required this.salt,
  });
}
