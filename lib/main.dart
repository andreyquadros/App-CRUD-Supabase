import 'package:basic_operations_supabase/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'YOUR-URL-SUPABASE-HERE',
    anonKey: 'YOUR-ANONKEY-SUPABASE-HERE',

  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.loginPage,
    routes: AppRoutes.define(),
  ));
}