import 'package:flutter/material.dart';
import 'package:klp4b_restaurantapp/modal/scanner.dart';
import 'package:klp4b_restaurantapp/screens/order_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 8, top: 2),
          child: Row(
            children: [
              Container(
                height: 38,
                width: 2,
                color: const Color(0xFF011A41),
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                children: [
                  const Text(
                    'RESTAURANT',
                    style: TextStyle(
                      color: Color(0xFF011A41),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(-45.0, 0.0, 0.0),
                    child: const Text(
                      'APP',
                      style: TextStyle(
                        color: Color(0xFFE71313),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: const Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'DAFTAR PESANAN',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 20,
                  color: Color(0xFF011A41),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Builder(builder: (context) => OrderList()),
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return Scanner();
                  });
            },
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 2.0,
                color: Color(0xFF011A41),
              ),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(28),
              backgroundColor: const Color(0xFFD8D8D8), // <-- Button color
              foregroundColor: const Color(0xFF011A41), // <-- Splash color
            ),
            child: const Icon(Icons.qr_code_scanner_outlined,
                color: Color(0xFF011A41)),
          ),
        ],
      ),
    );
  }
}
