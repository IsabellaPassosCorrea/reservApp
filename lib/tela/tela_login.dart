import 'package:reservapp2/uteis/botaoGradient.dart';
import 'package:flutter/material.dart';
import '../uteis/editordecampo.dart';
import 'controle/controle_abertura_login.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  late ControleTelaLogin _controle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controle = ControleTelaLogin();
  }

/*
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controle.formkey,
      child: Container(
        padding: EdgeInsets.only(
          top: 70,
          left: 40,
          right: 40,
        ),
        color: Color(0xFFB7D2DE),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 240,
              height: 240,
              child: Image.asset("assets/agendaInicio.png"),
            ),
            SizedBox(
              height: 20,
            ),
            CampoEdicao(
              "Email",
              texto_dica: "Digite seu Email",
              controlador: _controle.controlador_login,
              teclado: TextInputType.emailAddress,
              recebedor_foco: _controle.focus_senha,
            ),
            SizedBox(
              height: 10,
            ),
            CampoEdicao(
              "Senha",
              texto_dica: "Digite sua senha",
              passaword: true,
              validador: (String? text) {
                if (text!.isEmpty)
                  return "O campo '$text' está vazio e necessita ser preenchido";
                else if (text.length < 6)
                  return "A senha precisa ter no mínimo 6 caracteres e um";
                return null;
              },
              controlador: _controle.controlador_senha,
              marcador_foco: _controle.focus_senha,
              recebedor_foco: _controle.focus_botao,
            ),
            SizedBox(
              height: 20,
            ),
            BotaoGradient(
              textobotao: "Entrar",
              cor: Color(0xFF18738A),
              ao_clicar: () {
                _controle.logar(context);
              },
              marcador_foco: _controle.focus_botao,
            ),
          ],
        ),
      ),
    );
  }
}*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _controle.formkey,
      child: Container(
        color: Color(0xFFB7D2DE),
        padding: EdgeInsets.only(
          top: 70,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 240,
              height: 240,
              child: Image.asset("assets/agendaInicio.png"),
            ),
            CampoEdicao(
              "Login",
              texto_dica: "Digite o Login",
              controlador: _controle.controlador_login,
              teclado: TextInputType.emailAddress,
              recebedor_foco: _controle.focus_senha,
            ),
            SizedBox(
              height: 10,
            ),
            CampoEdicao(
              "Senha",
              texto_dica: "Digite a senha",
              passaword: true,
              validador: (String? text) {
                if (text!.isEmpty)
                  return "O campo '$text' está vazio e necessita ser preenchido";
                else if (text.length < 6)
                  return "A senha precisa ter no mínimo 6 caracteres";
                return null;
              },
              controlador: _controle.controlador_senha,
              marcador_foco: _controle.focus_senha,
              recebedor_foco: _controle.focus_botao,
            ),
            SizedBox(
              height: 20,
            ),
            BotaoGradient(
              textobotao: "Login",
              cor: Color.fromARGB(255, 55, 28, 162),
              ao_clicar: () {
                _controle.logar(context);
              },
              marcador_foco: _controle.focus_botao,
            ),
          ],
        ),
      ),
    );
  }
}
