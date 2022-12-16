class Reserva {
  String? idReserva;
  String? usuario;
  String? salas;
  String? turma;
  String? dataReservada;
  String? itemReserva;

  Reserva(
      {this.idReserva = null,
      this.usuario,
      this.salas,
      this.turma,
      this.itemReserva,
      this.dataReservada});

  @override
  String toString() {
    return 'Usuario{_id: $idReserva, _usuario: $usuario, _salas: $salas, _turma:'
        ' $turma, _itemreserva: $itemReserva,_dataReserva:$dataReservada}';
  }

  Reserva.fromMap(Map<String, dynamic> map) {
    usuario = map["usuario"];
    salas = map["salas"];
    turma = map["turma"];
    itemReserva = map["itemReserva"];
    dataReservada = map["dataReserva"];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.idReserva;
    data['usuario'] = this.usuario;
    data['salas'] = this.salas;
    data['turma'] = this.turma;
    data['itemReserva'] = this.itemReserva;
    data['dataReserva'] = this.dataReservada;

    return data;
  }

  void salvarReserva() {
    Map reserva_map = this.toMap();
  }
}
