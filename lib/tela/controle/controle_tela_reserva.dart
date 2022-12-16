import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reservapp2/modelo/reserva.dart';

import '../../modelo/usuario.dart';
import '../../uteis/nav.dart';

class ControleTelaRerva {
  Usuario usuario;

  ControleTelaRerva(this.usuario);

  CollectionReference<Map<String, dynamic>> get _collection_reserva =>
      FirebaseFirestore.instance.collection('reservas');

  final formkey = GlobalKey<FormState>();

  final controlador_sala = TextEditingController();
  final controlador_turma = TextEditingController();
  final controlador_dataReserva = TextEditingController();
  final controlador_itemReserva = TextEditingController();

  final focus_botao_salvar = FocusNode();

  void inicializar_campos() {
    controlador_sala.text = "";
    controlador_turma.text = "";
    controlador_dataReserva.text = "";
    controlador_itemReserva.text = "";
  }

  void _inserir_itemReserva() {
    Reserva itemReserva = Reserva(
        usuario: usuario.id,
        salas: controlador_sala.text,
        turma: controlador_turma.text,
        itemReserva: controlador_itemReserva.text,
        dataReservada: controlador_dataReserva.text);
    // Salvando no serviço de armazenamento
    DocumentReference docRef = _collection_reserva.doc();
    docRef.set(itemReserva.toMap());
  }

  void salvar_item(BuildContext context) {
    if (formkey.currentState!.validate()) {
      _inserir_itemReserva();
      pop(context);
    }
  }
}
