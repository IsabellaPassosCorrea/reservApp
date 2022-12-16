import 'package:reservapp2/tela/controle/controle_tela_prof_principal.dart';
import 'package:reservapp2/tela/tela_adm/tela_adm_redSenha.dart';
import 'package:reservapp2/tela/tela_prof/tela_prof_reserva.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';

import '../../modelo/usuario.dart';
//import 'package:iconforest_amazingneoicons/iconforest_amazingneoicons.dart';

class TelaProfPrincipal extends StatefulWidget {
  final Usuario usuario;

  TelaProfPrincipal(this.usuario);

  @override
  _TelaProfPrincipalState createState() => _TelaProfPrincipalState();
}

// Widget rolamento Listagem de Reservas Feitas
Widget itemReservado(Color cor, String nomeSalaReserva, Icon icone) =>
    Container(
      margin: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            nomeSalaReserva,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: icone,
          )
        ],
      ),
    );
//----------------------------------------------------------

ListTile _sair(BuildContext context, ControleTelaProfPrincipal _controle) {
  return ListTile(
    title: Text('Sair'),
    textColor: Colors.white,
    onTap: () {
      _controle.sair(context);
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

UserAccountsDrawerHeader _header() {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      color: Color(0xFFD96B7F),
    ),
    accountName: Text('Professor'),
    accountEmail: Text('emailprof@email.com'),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Color(0xFFBB3D54),
    ),
  );
}

class _TelaProfPrincipalState extends State<TelaProfPrincipal>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ControleTelaProfPrincipal _controle;

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

    _controle = ControleTelaProfPrincipal(widget.usuario);
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
            const Text(
              'Reservas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFFD96B7F),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      itemReservado(
                          Colors.greenAccent, "Teste1", Icon(Icons.computer)),
                      itemReservado(
                          Colors.yellowAccent, "Teste2", Icon(Icons.computer)),
                      itemReservado(
                          Colors.redAccent, "Teste3", Icon(Icons.room)),
                      itemReservado(
                          Colors.blueAccent, "Teste4", Icon(Icons.computer)),
                      itemReservado(
                          Colors.pinkAccent, "Teste5", Icon(Icons.room)),
                      itemReservado(
                          Colors.orangeAccent, "Teste6", Icon(Icons.computer)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF1F0408),
        child: ListView(
          children: <Widget>[
            _header(),
            _ajuda(context),
            _sair(context, _controle),
          ],
        ),
      ),
      appBar:
          AppBar(title: Text('Professor'), backgroundColor: Color(0xFFD96B7F)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionBubble(
          items: <Bubble>[
            Bubble(
              title: "Reservar",
              iconColor: Colors.white,
              bubbleColor: Color(0xFFD96B7F),
              icon: Icons.add_task,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _controle.irParaTelaReserva(context);
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
          backGroundColor: Color(0xFFD96B7F),
        ),
      ),
    );
  }
}
