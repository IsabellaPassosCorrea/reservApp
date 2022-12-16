import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservapp2/tela/tela_adm/tela_adm_cad_usuario.dart';
import 'package:reservapp2/tela/tela_login.dart';

import '../../modelo/usuario.dart';
import '../../uteis/nav.dart';

class ControleTelaADMPrincipal {
  Usuario usuario;
  List<Usuario>? grupoUsuarios;
  List<DocumentSnapshot>? document_users;

  ControleTelaADMPrincipal(this.usuario);

  CollectionReference<Map<String, dynamic>> get _collection_usuarios =>
      FirebaseFirestore.instance.collection('usuarios');

  CollectionReference<Map<String, dynamic>> get _collection_users =>
      FirebaseFirestore.instance.collection('');
  Stream<QuerySnapshot> get stream =>
      _collection_users.where("id_usuario", isEqualTo: usuario.id).snapshots();
/*
  void obterItens(QuerySnapshot data){
    document_users = data.docs;
    usuario = document_users!.map((DocumentSnapshot  document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return Usuario.fromMap(data);
    }).toList();
  }
*/
  void excluirUsuario(int index) {
    DocumentSnapshot documentSnapshot = document_users![index];
    documentSnapshot.reference.delete();
  }

  void sair(BuildContext context) {
    FirebaseAuth.instance.signOut();
    push(context, TelaLogin(), replace: true);
  }

  void irParaTelaCadUsuario(BuildContext context) {
    push(context, TelaAdmCadUsuario(usuario));
  }
}
