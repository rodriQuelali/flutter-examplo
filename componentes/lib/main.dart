import 'package:componentes/src/pages/alert_page.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componenetes APP',
      debugShowCheckedModeBanner: false,
      //home: HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings){
        print('ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
          );
      },
    );
  }
}