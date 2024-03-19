import 'package:basic_operations_supabase/pages/registerPersonPage.dart';
import 'package:flutter/cupertino.dart';

import 'pages/homePage.dart';
import 'pages/listPersonPage.dart';

class AppRoutes{
  static const homePage = '/homepage';
  static const registerPersonPage = '/registerPersonPage';
  static const listPersonPage = '/listPersonPage';

  static Map<String, WidgetBuilder> define(){
    return{
      homePage: (BuildContext context) => HomePage(),
      registerPersonPage: (BuildContext context) => RegisterPersonPage(),
      listPersonPage: (BuildContext context) => ListPersonPage(),
    };
  }
}