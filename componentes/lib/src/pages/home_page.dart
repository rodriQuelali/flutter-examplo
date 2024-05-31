

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icons_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }
  

  Widget _lista() {


   //print(menuProvider.opcion); 
  //  menuProvider.cargarData().then((opciones){
  //     print('_lista');
  //     print(opciones);
  //  });

   //futureBilder
   return FutureBuilder(
    future: menuProvider.cargarData(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
    
// print(snapshot.data);
      return ListView(
      children: _listaItems(snapshot.data, context),
      );
    },
   );

    /*return ListView(
      children: _listaItems(),
    );*/ 
  }
  
  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    data?.forEach((element) {
      final wigetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          Navigator.pushNamed(context, element['ruta']);
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );
          // Navigator.push(context, route);
        },
      );

      opciones..add(wigetTemp)
              ..add(Divider());
    });

    return opciones;
  }
}