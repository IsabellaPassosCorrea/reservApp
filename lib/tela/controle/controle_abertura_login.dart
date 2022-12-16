import 'package:reservapp2/tela/tela_serv/tela_serv_princ.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../modelo/usuario.dart';
import '../../uteis/toast.dart';
import '../tela_adm/tela_adm_princ.dart';
import 'package:reservapp2/uteis/nav.dart';
import '../tela_prof/tela_prof_princ.dart';

class ControleTelaLogin {
  final controlador_login = TextEditingController();
  final controlador_senha = TextEditingController();

  final formkey = GlobalKey<FormState>();
  final focus_senha = FocusNode();
  final focus_botao = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>> get _collection_usuarios =>
      FirebaseFirestore.instance.collection('usuarios');

  void logar(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      String login = controlador_login.text.trim();
      String senha = controlador_senha.text.trim();

      try {
        // Logando
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: login, password: senha);
        print("logado");
        _irParaTelaPrincipal(userCredential.user, context);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          MensagemAlerta(
              context, "Erro: Usuário não encontrado para o email informado");
        } else if (e.code == 'wrong-password') {
          MensagemAlerta(
            context,
            "Erro: Password inválido!!!",
          );
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  void _irParaTelaPrincipal(User? user, BuildContext context) {
    _collection_usuarios
        .where("email", isEqualTo: "${user!.email}")
        .snapshots()
        .listen((data) {
      Usuario usuario = Usuario.fromMap(data.docs[0].data());
      usuario.id = data.docs[0].id;
      print("Chegouaqui");

      if (usuario.grupoUsuario == "Administrador") {
        push(context, TelaAdmPrincipal(usuario), replace: true);
      } else if (usuario.grupoUsuario == "Professor") {
        push(context, TelaProfPrincipal(usuario), replace: true);
      } else {
        push(context, TelaSerPrincipal(usuario), replace: true);
      }
    });
  }

  void cadastrar(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      String login = controlador_login.text.trim();
      String senha = controlador_senha.text.trim();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: login, password: senha);

        // No serviço de armazenamento
        _collection_usuarios
            .add({
              'email': login,
            })
            .then((value) => _irParaTelaPrincipal(userCredential.user, context))
            .catchError(
                (error) => print("Falha ao adicionar o usuário: $error"));
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
