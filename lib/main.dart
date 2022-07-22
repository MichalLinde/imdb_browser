import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imdb_browser/modules/app_module.dart';
import 'package:imdb_browser/views/pages/home_page.dart';

void main() => runApp(ModularApp(module: AppModule(), child: MyApp()));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: "IMDB browser",
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
