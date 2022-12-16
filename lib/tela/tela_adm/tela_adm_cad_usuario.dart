import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:elegant_radio_button_group/elegant_radio_button_group.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reservapp2/modelo/usuario.dart';

import '../controle/controle_tela_cad_usuario.dart';

//--------------------------------

const List _listaGrupo = ["Administrador", "Professor", "Servidor"];

class TelaAdmCadUsuario extends StatefulWidget {
  final Usuario usuario;

  TelaAdmCadUsuario(this.usuario);

  @override
  State<TelaAdmCadUsuario> createState() => _TelaAdmCadUsuarioState();
}

class _TelaAdmCadUsuarioState extends State<TelaAdmCadUsuario> {
  String _verticalGroupValue = "Pending";
  List<String> _status = ["Administrador", "Professor", "Servidor"];
  late int? selectedValue;
  late ControleCadUsuario _controle;

  @override
  void initState() {
    super.initState();

    _controle = ControleCadUsuario();
  }

  @override
  Widget build(BuildContext context) {
    selectedValue = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
        backgroundColor: Color(0xFF89C3D2),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _controle.formkey,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _controle.controlador_nomeUsuario,
              autofocus: true,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nome ",
                labelStyle: TextStyle(
                  color: Color(0xFF104079),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controle.controlador_emailUsuario,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Color(0xFF104079),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controle.controlador_senha,
              autofocus: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Color(0xFF104079),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controle.controlador_confirmarSenha,
              autofocus: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Confirmar Senha",
                labelStyle: TextStyle(
                  color: Color(0xFF104079),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _controle.controlador_grupoUsuario,
              autofocus: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "A Qual grupo pertence: ",
                labelStyle: TextStyle(
                  color: Color(0xFF104079),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedButton(
                    onPress: (
                        // retornar a lista para pegar em outro lugar
                        ) {
                      _controle.cadastrar(context);
                    },
                    height: 70,
                    width: 180,
                    borderRadius: 20,
                    text: 'Salvar',
                    gradient: LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.blueAccent]),
                    selectedGradientColor: LinearGradient(
                        colors: [Color(0xFF56A7C5), Color(0xFF18738A)]),
                    isReverse: true,
                    selectedTextColor: Colors.black,
                    transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                    borderColor: Colors.white,
                    borderWidth: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
