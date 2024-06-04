import 'package:hive/hive.dart';

part 'us_db.g.dart';

//execute dart run build_runner build to generate the .g file

@HiveType(typeId: 1)
class UserDb extends HiveObject {
  UserDb({
    required this.firstName,
    required this.password,
    required this.email,
  });
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
}