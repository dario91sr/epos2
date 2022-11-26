import 'package:epos2/bloc/scontrino_bloc.dart';
import 'package:epos2/venditaScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(bodyText1: TextStyle(fontSize: 20)),
        primarySwatch: Colors.blue,
      ),
      home: VenditaScreen(),
    );
  }
}
