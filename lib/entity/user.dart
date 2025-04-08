
class User {
  String? username;
  String? password;
  String? tokenApi;
  String? usuarioIdApi;
  DateTime? userExpiresIn;
  DateTime? tokenExpiresIn;

  User({this.username, this.password, this.tokenApi, this.usuarioIdApi, this.userExpiresIn, this.tokenExpiresIn});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    userExpiresIn = DateTime.now().add(
      const Duration(
        days: 6,
      ),
    );
    tokenExpiresIn = DateTime.now().add(
      Duration(
        seconds: json['expiresIn'] as int,
      ),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'username': username,
        'password': password,
      };

}
