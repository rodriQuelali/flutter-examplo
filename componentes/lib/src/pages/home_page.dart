import 'package:componentes/src/providers/menu_provider.dart';
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


   print(menuProvider.opcion); 
    return ListView(
      children: _listaItems(),
    ); 
  }
  
  List<Widget> _listaItems() {
    return [
      ListTile(title: Text("hello word"),),
      Divider(),
      ListTile(title: Text("hello word"),),
      Divider(),
      ListTile(title: Text("hello word"),)
    ];
  }
}