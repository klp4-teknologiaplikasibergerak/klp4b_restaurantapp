import 'package:klp4b_restaurantapp/screens/home.dart';
import 'package:klp4b_restaurantapp/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:klp4b_restaurantapp/screens/order_list.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OrderList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
