import 'package:flutter/material.dart';
import 'package:klp4b_restaurantapp/screens/main_page.dart';

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
                      height: 240,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              transform:
                                  Matrix4.translationValues(20.0, 12.0, 0.0),
                              child: const Text(
                                'Jumlah Makanan',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 20,
                                  color: Color(0xFF011A41),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
                            child: Container(
                              width: 304.0,
                              decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Color(0xFF011A41), width: 1.5),
                                    bottom: BorderSide(
                                        color: Color(0xFF011A41), width: 1.5),
                                    left: BorderSide(
                                        color: Color(0xFF011A41), width: 12.0),
                                    right: BorderSide(
                                        color: Color(0xFF011A41), width: 1.5),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              child: const ListTile(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const Home()),
                                //   );
                                // },
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Nama Menu',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Harga',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 68, 75, 85),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    // Text(
                                    //   'Jumlah',
                                    //   style: TextStyle(
                                    //     color: Color.fromARGB(255, 68, 75, 85),
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w600,
                                    //     fontStyle: FontStyle.italic,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, 18.0, 0.0),
                            child: SizedBox(
                              width: 160,
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              const BorderSide(width: 4)),
                                      hintText: 'Jumlah')),
                            ),
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, 28.0, 0.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF011A41)),
                              child: const Text('Submit'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              },
                            ),
                          ),
                        ],
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
