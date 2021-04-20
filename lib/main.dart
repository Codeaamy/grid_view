import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gridview/HomeView.dart';

void main(){
  runApp(GridView());
}

class GridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(),
    );
  }
}
