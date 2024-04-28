class User {
  User({
    this.id,
    required this.firstName,
    required this.email,
    required this.password,
  });

  int? id;
  String firstName;
  String password;
  String email;

  String get name => firstName;

  String get emailAddress => email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        email: json["email"] ?? "someemail",
        password: json["password"] ?? "somePassword",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstName": firstName,
        "email": email,
        "password": password,
      };
}
