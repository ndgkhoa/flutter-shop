import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/shared/appstyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('This is cart',
                style: appstyle(40, Colors.black, FontWeight.bold))));
  }
}
