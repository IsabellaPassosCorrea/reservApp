import 'package:reservapp2/tela/controle/controle_tela_adm_principal.dart';
import 'package:reservapp2/tela/tela_adm/tela_adm_cad_usuario.dart';
import 'package:reservapp2/tela/tela_adm/tela_adm_redSenha.dart';
import 'package:reservapp2/tela/tela_login.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../../modelo/usuario.dart';
//import 'package:iconforest_amazingneoicons/iconforest_amazingneoicons.dart';

class TelaAdmPrincipal extends StatefulWidget {
  final Usuario usuario;

  TelaAdmPrincipal(this.usuario);

  @override
  State<TelaAdmPrincipal> createState() => _TelaAdmPrincipalState();
}

ListTile _listUser(BuildContext context) {
  return ListTile(
    leading: Icon(Icons.person),
    iconColor: Colors.white,
    title: Text('Listagem de Usuários'),
    textColor: Colors.white,
    onTap: () {},
  );
}

ListTile _ajuda(BuildContext context) {
  return ListTile(
    leading: Icon(Icons.help_outline_outlined),
    iconColor: Colors.white,
    title: Text('Ajuda'),
    textColor: Colors.white,
    onTap: () {},
  );
}

ListTile _redSenha(BuildContext context) {
  return ListTile(
    leading: Icon(Icons.key),
    iconColor: Colors.white,
    title: Text('Redefinir Senhas'),
    textColor: Colors.white,
    onTap: () {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => TelaAdmRedSenha()));
    },
  );
}

ListTile _modNoturno(BuildContext context) {
  return ListTile(
    title: Text('Modo Noturno'),
    textColor: Colors.white,
    onTap: () {},
  );
}

ListTile _sair(BuildContext context) {
  return ListTile(
    title: Text('Sair'),
    textColor: Colors.white,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaLogin()),
      );
    },
  );
}

ExpansionTile _grupoCadListagem(BuildContext context) {
  return ExpansionTile(
    title: Text('Cadastros Feitos', style: TextStyle(color: Colors.blueAccent)),
    children: <Widget>[
      _listUser(context),
    ],
  );
}

UserAccountsDrawerHeader _header() {
  return UserAccountsDrawerHeader(
    accountName: Text('Administrador'),
    accountEmail: Text('email@email.com'),
    currentAccountPicture: CircleAvatar(),
  );
}

class _TelaAdmPrincipalState extends State<TelaAdmPrincipal>
    with SingleTickerProviderStateMixin {
  @override
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ControleTelaADMPrincipal _controle;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    _controle = ControleTelaADMPrincipal(widget.usuario);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlutterCalendar(),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedButton(
                onPress: () {},
                height: 70,
                width: MediaQuery.of(context).size.width,
                borderRadius: 20,
                text: 'Relatórios',
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
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF102431),
        child: ListView(
          children: <Widget>[
            _header(),
            _grupoCadListagem(context),
            _redSenha(context),
            _modNoturno(context),
            _sair(context),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Administrador'),
        backgroundColor: Color(0xFF89C3D2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionBubble(
          items: <Bubble>[
            Bubble(
              title: "Usuário",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.person_add_alt_outlined,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _controle.irParaTelaCadUsuario(context);

                _animationController.reverse();
              },
            ),
          ],
          animation: _animation,
          onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),
          iconColor: Colors.white,
          iconData: Icons.add,
          backGroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
