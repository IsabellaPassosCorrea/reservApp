import 'package:reservapp2/tela/tela_serv/tela_serv_princ.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../modelo/usuario.dart';
import '../../uteis/toast.dart';
import '../tela_adm/tela_adm_princ.dart';
import 'package:reservapp2/uteis/nav.dart';
import '../tela_prof/tela_prof_princ.dart';

class ControleCadUsuario {
  final controlador_nomeUsuario = TextEditingController();
  final controlador_emailUsuario = TextEditingController();
  final controlador_grupoUsuario = TextEditingController();
  final controlador_senha = TextEditingController();
  final controlador_confirmarSenha = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final focus_senha = FocusNode();
  final focus_botao = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _collection_usuarios =>
      FirebaseFirestore.instance.collection('usuarios');

  String validarConfirmacaoSenha(BuildContext context) {
    if (controlador_confirmarSenha != controlador_senha) {
      MensagemAlerta(context, "A senha e sua confirmação devem ser iguais!");
      return "";
    }
    return controlador_confirmarSenha.text.trim();
  }

  void cadastrar(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      String nome = controlador_nomeUsuario.text.trim();
      String email = controlador_emailUsuario.text.trim();
      String grupo = controlador_grupoUsuario.text.trim();
      String senha = controlador_senha.text.trim();
      String confirmarSenha = validarConfirmacaoSenha(context);

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: senha);
        _collection_usuarios.add({
          'email': email,
          'grupo': grupo,
          'nome': nome,
          'foto': "",
        }).catchError((error) => print("Falha ao adicionar o usuário: $error"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          MensagemAlerta(context, "Erro: A senha fornecida é muito fraca");
        } else if (e.code == 'email-already-in-use') {
          MensagemAlerta(
              context, "Erro: Já existe conta com o email informado");
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
