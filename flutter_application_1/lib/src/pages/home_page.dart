import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    final estiloTexto = TextStyle(fontSize:  25.0);
    final  conteo = 10;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Titutlo'),
        centerTitle: true,
        elevation: 5.0,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('numero de clicksss: ', style: estiloTexto,),
            Text('$conteo', style: estiloTexto,),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          conteo = conteo + 1;
        }, 
        child: Icon(Icons.add),
      ),
    );
  }
}