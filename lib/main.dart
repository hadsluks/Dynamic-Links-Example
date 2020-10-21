import 'package:dynamicLinksExample/home.dart';
import 'package:dynamicLinksExample/utilities.dart';
import 'package:flutter/material.dart';

void main() {
  initFirebaseDynamicUrlPlugin();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
