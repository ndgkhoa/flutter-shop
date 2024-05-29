import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body:Center(
        child:Text(
          "MainScreen",
          style:TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}