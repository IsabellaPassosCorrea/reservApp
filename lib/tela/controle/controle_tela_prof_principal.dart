import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservapp2/modelo/reserva.dart';
import 'package:reservapp2/tela/tela_login.dart';
import 'package:reservapp2/tela/tela_prof/tela_prof_reserva.dart';

import '../../modelo/usuario.dart';
import '../../uteis/nav.dart';

class ControleTelaProfPrincipal {
  Usuario usuario;
  List<Reserva>? reservas;
  List<DocumentSnapshot>? document_reservas;

  ControleTelaProfPrincipal(this.usuario);

  CollectionReference<Map<String, dynamic>> get _collection_itens =>
      FirebaseFirestore.instance.collection('reservas');
  Stream<QuerySnapshot> get stream =>
      _collection_itens.where("id_usuario", isEqualTo: usuario.id).snapshots();

  void obterReservas(QuerySnapshot data) {
    document_reservas = data.docs;
    reservas = document_reservas!.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return Reserva.fromMap(data);
    }).toList();
  }

  void excluirItem(int index) {
    DocumentSnapshot documentSnapshot = document_reservas![index];
    documentSnapshot.reference.delete();
  }

  void sair(BuildContext context) {
    FirebaseAuth.instance.signOut();
    push(context, TelaLogin(), replace: true);
  }

  void irParaTelaReserva(BuildContext context) {
    push(context, TelaProfReserva(usuario));
  }
}
