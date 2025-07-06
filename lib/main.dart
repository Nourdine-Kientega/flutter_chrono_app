import 'package:flutter/material.dart';

import 'package:flutter/services.dart';


void main() {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,          // Fond de la barre système
    statusBarIconBrightness: Brightness.dark, // Icônes (heure, batterie…) foncées
  ));
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Text('Hi Nourdine!'),
        )
      ),
    );
  }
}