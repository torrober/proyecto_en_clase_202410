class Report {
  Report({
    this.id,
    required this.score,
    required this.description,
    required this.idClient,
    required this.horaInicio,
    required this.duracion,
  });

  int? id;
  String description;
  int score;
  int idClient; // Cambiar el tipo de String a int
  String horaInicio;
  int duracion; // Cambiar el tipo de String a int

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        score: json["Score"] ?? 0, // Manejar el caso de valor nulo
        description: json["description"] ?? "somedescription",
        idClient: json["idClient"] ?? 0, // Manejar el caso de valor nulo
        horaInicio: json["horaInicio"] ?? "somehora",
        duracion: json["duracion"] ?? 0, // Manejar el caso de valor nulo
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "score": score,
        "description": description,
        "idClient": idClient,
        "horaInicio": horaInicio,
        "duracion": duracion,
      };
}
