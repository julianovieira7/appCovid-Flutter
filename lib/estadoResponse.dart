import 'dart:ffi';

class EstadoResponse{
  late String sigla;
  late int numeroCasos;
  late double recuperados;
  late double vacinados;
  late int numeroMortos;
  EstadoResponse.without_parameters();
  EstadoResponse.withJSON(json)
      : this.sigla = json['sigla'],
        this.numeroCasos= json['numeroCasos'],
        this.recuperados= json['recuperados'],
        this.vacinados= json['vacinados'],
        this.numeroMortos= json['numeroMortos'];

  @override
  String toString() {
    return 'EstadoResponse{sigla: $sigla, numeroCasos: $numeroCasos, recuperados: $recuperados, vacinados: $vacinados, numeroMortos: $numeroMortos}';
  }
}