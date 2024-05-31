import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  
  List<dynamic> opcion = [];

  _MenuProvider(){
    cargarData();
  }
  
  Future<List <dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map<String, dynamic> dataMap = json.decode(resp);
    opcion = dataMap['rutas'];

    return opcion;
  }
}

final menuProvider = new _MenuProvider();