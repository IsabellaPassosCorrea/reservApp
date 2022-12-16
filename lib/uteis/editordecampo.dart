import 'package:flutter/material.dart';

class CampoEdicao extends StatelessWidget {
  String texto_label;
  String texto_dica;
  bool passaword;
  TextEditingController? controlador;
  FormFieldValidator<String>? validador;
  TextInputType teclado;
  FocusNode? marcador_foco;
  FocusNode? recebedor_foco;

  CampoEdicao(this.texto_label,
      {this.texto_dica = "",
      this.passaword = false,
      this.controlador = null,
      this.validador = null,
      this.teclado = TextInputType.text,
      this.marcador_foco = null,
      this.recebedor_foco = null}) {
    if (this.validador == null) {
      this.validador = (String? text) {
        if (text!.isEmpty) {
          return "O campo '$texto_label' está vazio!";
        }
        return null;
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validador,
      obscureText: passaword,
      controller: controlador,
      keyboardType: teclado,
      textInputAction: TextInputAction.next,
      focusNode: marcador_foco,
      onFieldSubmitted: (String text) {
        FocusScope.of(context).requestFocus(recebedor_foco);
      },
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: texto_label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: texto_dica,
        // Estilo do hintText
        hintStyle: TextStyle(
          fontSize: 10,
          color: Colors.green,
        ),
      ),
    );
  }
}
