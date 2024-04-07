import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    final estiloTexto = TextStyle(fontSize:  25.0);

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
            Text('numero de clicks: ', style: estiloTexto,),
            Text('0', style: estiloTexto,),
          ],
        )
      ),
    );
  }
}