import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class TelaAdmRedSenha extends StatefulWidget {
  const TelaAdmRedSenha({Key? key}) : super(key: key);

  @override
  State<TelaAdmRedSenha> createState() => _TelaAdmRedSenhaState();
}

class _TelaAdmRedSenhaState extends State<TelaAdmRedSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redefinir Senha de Usuário'),
        backgroundColor: Color(0xFF89C3D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nome do Usuario ",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: AnimatedButton(
                    onPress: (// retornar a lista para pegar em outro lugar
                        ) {},
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
