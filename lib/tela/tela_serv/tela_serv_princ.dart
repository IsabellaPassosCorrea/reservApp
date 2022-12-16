import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:reservapp2/tela/controle/controle_tela_serv_principal.dart';

import '../../modelo/usuario.dart';
//import 'package:iconforest_amazingneoicons/iconforest_amazingneoicons.dart';

class TelaSerPrincipal extends StatefulWidget {
  final Usuario usuario;

  TelaSerPrincipal(this.usuario);

  @override
  State<TelaSerPrincipal> createState() => _TelaSerPrincipalState();
}

ListTile _relaEquip(BuildContext context) {
  return ListTile(
    leading: Icon(Icons.computer),
    iconColor: Colors.white,
    title: Text('Relatorio de Equipamentos'),
    textColor: Colors.white,
  );
}

ListTile _sair(BuildContext context, ControleTelaServPrincipal controle) {
  return ListTile(
    title: Text('Sair'),
    textColor: Colors.white,
    onTap: () {
      controle.sair(context);
    },
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

ExpansionTile _grupoReservListagem(BuildContext context) {
  return ExpansionTile(
    title: Text('Relatorios', style: TextStyle(color: Color(0xFFFFFFFF))),
    children: <Widget>[
      _relaEquip(context),
    ],
  );
}

UserAccountsDrawerHeader _header() {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      color: Color(0xFF57D563),
    ),
    accountName: Text("Servidor"),
    accountEmail: Text("exemploemail@gmail.com"),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Color(0xFF35AB44),
    ),
  );
}

class _TelaSerPrincipalState extends State<TelaSerPrincipal>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ControleTelaServPrincipal _controle;

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
    _controle = ControleTelaServPrincipal(widget.usuario);
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
              child: Expanded(
                child: AnimatedButton(
                  onPress: () {},
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 20,
                  text: 'Relatorio Do Dia',
                  gradient: LinearGradient(
                      colors: [Color(0xFF57D563), Color(0xFF36883D)]),
                  selectedGradientColor: LinearGradient(
                      colors: [Color(0xFF36883D), Color(0xFF235B29)]),
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                  borderColor: Colors.white,
                  borderWidth: 1,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF173619),
        child: ListView(
          children: <Widget>[
            _header(),
            _grupoReservListagem(context),
            _ajuda(context),
            _sair(context, _controle),
          ],
        ),
      ),
      appBar:
          AppBar(title: Text('Servidor'), backgroundColor: Color(0xFF57D563)),
    );
  }
}
