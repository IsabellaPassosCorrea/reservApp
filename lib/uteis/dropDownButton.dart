import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

const List<String> listaAcesso = <String>[
  'Acesse sua área',
  'Administrador',
  'Professor',
  'Servidor'
];
final dropValue = ValueNotifier('');

final itemsLista = [
  'Administrador',
  'Professor',
  'Servidor',
];
String? selectedValue;

class DropMenu extends StatefulWidget {
  late String _selecaoAcessoMenu;

  DropMenu(this._selecaoAcessoMenu);

  String get _selecaoAcesoMenu => _selecaoAcessoMenu;

  @override
  State<DropMenu> createState() => DropMenuState(_selecaoAcessoMenu);
}

class DropMenuState extends State<DropMenu> {
  late String _selecaoAcessoMenuState;

  DropMenuState(this._selecaoAcessoMenuState);

  String get selecaoAcessoMenuState => _selecaoAcessoMenuState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFFB7D2DE),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(8),
      child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (BuildContext context, String value, _) {
            return SizedBox(
                child: DropdownButton2<String>(
              isExpanded: true,
              hint: const Text("Acesse sua área"),
              value: (value.isEmpty) ? null : value,
              onChanged: (_escolha) {
                dropValue.value = _escolha.toString();
                setState(() {
                  _selecaoAcessoMenuState = _escolha.toString();
                });
              },
              items: itemsLista
                  .map((op) => DropdownMenuItem(
                        value: op,
                        child: Text(op),
                      ))
                  .toList(),
            ));
          }),
    ));
  }
}
