import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';

void MensagemAlerta(BuildContext context, String msg) {
  FToast.toast(
    context,
    msg: msg,
    color: Colors.red,
    duration: 5000,
    msgStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
  );
}
