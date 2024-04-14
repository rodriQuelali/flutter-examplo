
import 'package:flutter/material.dart';

class HomePagestemp extends StatelessWidget {
  HomePagestemp({super.key});

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemCorto()
      ),
    );
  }

  //metodos
  //primera opcion
  List<Widget> _crearItems(){
    List<Widget> lista = [];
    for (String opt in opciones) {
      final temWidgest = ListTile(
        title: Text(opt),
      );

      //operador de cascada
      lista..add(temWidgest)
            ..add(Divider());

    }
    return lista;
  }

  //otra opcion
  List<Widget> _crearItemCorto (){
    return opciones.map((e){
        return Column(
          children: [
            ListTile(
              title: Text(e + '!'),
              subtitle: Text('Subtitulo'),
              leading: Icon(Icons.ac_unit_rounded),
              trailing: Icon(Icons.keyboard_arrow_right),
           ),
            Divider()
          ],
        );
    }).toList();
    
  }
}
