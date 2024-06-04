import 'package:hive/hive.dart';

part 'report_db.g.dart';

//execute dart run build_runner build to generate the .g file

@HiveType(typeId: 1)
class ReportDb extends HiveObject {
  ReportDb({
    required this.id,
    required this.idUS,
    required this.score,
    required this.duracion,
    required this.horaInicio,
    required this.nameClient,
    required this.description,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  int idUS;
  @HiveField(2)
  int score;
  @HiveField(3)
  String duracion;
  @HiveField(4)
  String horaInicio;
  @HiveField(5)
  String nameClient;
  @HiveField(6)
  String description;
}