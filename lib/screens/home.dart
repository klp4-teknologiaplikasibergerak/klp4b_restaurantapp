import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
              height: 140,
            ),
            const Icon(
              Icons.no_meals_ouline,
              size: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Data belum tersedia',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 16,
                color: Color.fromARGB(255, 75, 75, 75),
              ),
            ),
            const SizedBox(
              height: 160,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
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
      ),
    );
  }
}
