class Registro {
  int? id;
  String maquina;
  double horimetro; //inicial
  // String horimetro FInal
  String dia;
  //String mes;
  // double total = horimetroFinal - horimetroInicial;

  Registro({required this.maquina, required this.horimetro, required this.dia});

  Map<String, dynamic> toMap() {
    return {
      'maquina': maquina,
      'horimetro': horimetro,
      'dia': dia,
    };
  }

  factory Registro.fromMap(Map<String, dynamic> map) {
    return Registro(
      maquina: map['maquina'],
      horimetro: map['horimetro'],
      dia: map['dia'],
    );
  }
  void setId(int valor) {
    this.id = valor;
  }

  int? getId() {
    return this.id;
  }

  String toFileString() {
    return 'Maquina: $maquina | Horimetro: $horimetro | Dia: $dia\n';
  }
}
