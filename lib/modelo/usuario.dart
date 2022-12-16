Comparator<Usuario> usuarioPorNome =
    (u1, u2) => u1.nomeUsuario!.compareTo(u2.nomeUsuario!);

class Usuario extends Object {
  String? nomeUsuario;
  String? emailUsuario;
  String? grupoUsuario;
  String? urlFoto;
  String? id;

  Usuario(
      {this.id = null,
      this.nomeUsuario,
      this.emailUsuario,
      this.grupoUsuario,
      this.urlFoto = ""});

  @override
  String toString() {
    return 'Usuario{_id: $id, _nomeUsuario: $nomeUsuario, _emailUsuario: $emailUsuario, _grupoUsuario: $grupoUsuario, _urlFoto: $urlFoto}';
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    nomeUsuario = map["nome"];
    grupoUsuario = map["grupo"];
    emailUsuario = map["email"];

    urlFoto = map["foto"];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nomeUsuario;
    data['grupo'] = this.grupoUsuario;
    data['email'] = this.emailUsuario;
    data['foto'] = this.urlFoto;

    return data;
  }

  void salvarUsuario() {
    Map usuario_map = this.toMap();
  }
}
