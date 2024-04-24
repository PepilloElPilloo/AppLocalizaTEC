import 'package:flutter/material.dart';
import 'package:localizatec_app2/screens/bottomTabBar/FabTabs.dart';
import 'package:localizatec_app2/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localiza TEC',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
      //home: FabTabs()
    );
  }
}
