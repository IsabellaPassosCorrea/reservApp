import 'package:flutter/material.dart';

class BotaoGradient extends StatelessWidget {
  String textobotao;
  VoidCallback? ao_clicar;
  FocusNode? marcador_foco;
  Color? cor;
  bool mostrar_progress;

  BotaoGradient(
      {required this.textobotao,
      required this.ao_clicar,
      this.marcador_foco,
      this.cor,
      this.mostrar_progress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [
            Color(0xFF66B1E1),
            Color(0xFF1A7CC2),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox.expand(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
          ),
          child: mostrar_progress
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  textobotao,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
          onPressed: ao_clicar,
          focusNode: marcador_foco,
        ),
      ),
    );
  }
}
