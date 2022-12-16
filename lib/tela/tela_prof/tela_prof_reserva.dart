import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:reservapp2/modelo/reserva.dart';
import 'package:reservapp2/tela/controle/controle_tela_reserva.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../modelo/usuario.dart';

class TelaProfReserva extends StatefulWidget {
  final Usuario usuario;

  TelaProfReserva(this.usuario);

  @override
  State<TelaProfReserva> createState() => TelaProfReservaState();
}

class TelaProfReservaState extends State<TelaProfReserva> {
  String _verticalGroupValue = "Pending";
  List<String> _status = ["Equipamento", "Laboratório"];
  late int? selectedValue;

  late ControleTelaRerva _controle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controle = ControleTelaRerva(widget.usuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas'),
        backgroundColor: Color.fromARGB(255, 205, 71, 107),
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
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _controle.controlador_itemReserva,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nome do Equipamento/Laboratório ",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 148, 19, 51),
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
              controller: _controle.controlador_sala,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nome da Sala",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 148, 19, 51),
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
              controller: _controle.controlador_turma,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nome da Turma",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 148, 19, 51),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              onChanged: (_qtdDiasPrevios) {},
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controle.controlador_dataReserva,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Reserva para qual dia",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 148, 19, 51),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              onChanged: (_qtdDiasMin) {},
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedButton(
                    onPress: () {
                      setState(
                        () {
                          _controle.salvar_item(context);
                          _controle.inicializar_campos();
                        },
                      );
                    },
                    height: 70,
                    width: 180,
                    borderRadius: 20,
                    text: 'Salvar',
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 215, 105, 121),
                      Color.fromARGB(255, 187, 49, 70)
                    ]),
                    selectedGradientColor: LinearGradient(colors: [
                      Color.fromARGB(255, 172, 29, 50),
                      Color.fromARGB(255, 146, 2, 24)
                    ]),
                    isReverse: true,
                    selectedTextColor: Colors.black,
                    transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                    borderColor: Colors.white,
                    borderWidth: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
