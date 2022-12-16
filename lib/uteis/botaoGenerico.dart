import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class BotaoGenericoState {
  String _texto = '';

  BotaoGenericoState(this._texto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedButton(
                  animatedOn: AnimatedOn.onHover,
                  onPress: () {},
                  onChanges: (change) {},
                  height: 70,
                  width: 200,
                  text: _texto,
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TOP_ROUNDER,
                  backgroundColor: Colors.black,
                  selectedBackgroundColor: Colors.lightGreen,
                  borderColor: Colors.white,
                  borderWidth: 1,
                ),
              ],
            ),
          ),
        ));
  }
}
