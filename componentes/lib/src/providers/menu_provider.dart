import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  
  List<dynamic> opcion = [];

  _MenuProvider(){
    cargarData();
  }
  
  void cargarData() {
      rootBundle.loadString('data/menu_opts.json').then((value) => {
          Map<String, dynamic> dataMap = json.decode(value);
          print(dataMap);
        }).catchError((err){

        })
  }

   cargarData2() {
    rootBundle.loadString('data/menu_opts.json').then((value) {
      Map<String, dynamic> dataMap = json.decode(value);
      opciones = dataMap['options']; // Asegúrate de que tu JSON tiene una clave 'options'
      print(opciones);
    }).catchError((error) {
      print("Error al cargar el archivo JSON: $error");
    });
  }
}

final menuProvider = new _MenuProvider();