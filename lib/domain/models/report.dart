class Report {
  Report({
    this.id,
    required this.score,
    required this.description,
    required this.nameClient,
    required this.horaInicio,
    required this.duracion,
    required this.idUS,
  });

  int? id;
  String description;
  int score;
  String nameClient; // Cambiar el tipo de String a int
  String horaInicio;
  int duracion; // Cambiar el tipo de String a int
  int? idUS;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        score: json["score"] ?? 0, // Manejar el caso de valor nulo
        description: json["description"] ?? "somedescription",
        nameClient: json["nameClient"] ?? "someName", // Manejar el caso de valor nulo
        horaInicio: json["horaInicio"] ?? "somehora",
        duracion: json["duracion"] ?? 0, // Manejar el caso de valor nulo
        idUS: json["idUS"] ?? 0
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "score": score,
        "description": description,
        "nameClient": nameClient,
        "horaInicio": horaInicio,
        "duracion": duracion,
        "idUS": idUS ?? 0
      };
}
