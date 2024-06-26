
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_pages.dart';
import 'package:componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
          '/': (BuildContext context) => HomePage(),
          'alert': (BuildContext context) => AlertPage(),
          'avatar': (BuildContext context) => AvatarPage(),
        };
}
