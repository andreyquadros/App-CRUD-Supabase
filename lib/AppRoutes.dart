import 'package:basic_operations_supabase/pages/listProductsPage.dart';
import 'package:basic_operations_supabase/pages/listSupplierPage.dart';
import 'package:basic_operations_supabase/pages/registerPersonPage.dart';
import 'package:basic_operations_supabase/pages/registerProductPage.dart';
import 'package:basic_operations_supabase/pages/registerSupplierPage.dart';
import 'package:basic_operations_supabase/pages/signUpPage.dart';
import 'package:flutter/cupertino.dart';

import 'pages/forgotPage.dart';
import 'pages/homePage.dart';
import 'pages/listPersonPage.dart';
import 'pages/loginPage.dart';

class AppRoutes{
  static const homePage = '/homepage';
  static const registerPersonPage = '/registerPersonPage';
  static const listPersonPage = '/listPersonPage';
  static const registerSupplierPage = '/registerSupplierPage';
  static const listSupplierPage = '/listSupplierPage';
  static const registerProductPage = '/registerProductPage';
  static const listProductsPage = '/listProductsPage';
  static const signUpPage = '/signUpPage';
  static const loginPage = '/loginPage';
  static const forgotPage = '/forgotPage';

  static Map<String, WidgetBuilder> define(){
    return{
      homePage: (BuildContext context) => HomePage(),
      registerPersonPage: (BuildContext context) => RegisterPersonPage(),
      listPersonPage: (BuildContext context) => ListPersonPage(),
      registerSupplierPage: (BuildContext context) => RegisterSupplierPage(),
      listSupplierPage: (BuildContext context) => ListSupplierPage(),
      registerProductPage: (BuildContext context) => RegisterProductPage(),
      listProductsPage: (BuildContext context) => ListProductsPage(),
      signUpPage: (BuildContext context) => SignUpPage(),
      loginPage: (BuildContext context) => LoginPage(),
      forgotPage: (BuildContext context) => ForgotPage(),
    };
  }
}