import 'package:klp4b_restaurantapp/screens/home.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: -50,
            left: -50,
            child: Image(
              height: 168,
              width: 400,
              image: AssetImage("assets/images/icon1.png"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120),
            child: Align(
              child: Column(
                children: [
                  const Text(
                    "RESTAURANT",
                    style: TextStyle(
                      color: Color(0xFF011A41),
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    transform: Matrix4.translationValues(0, -9, 0),
                    child: const Text(
                      "APP",
                      style: TextStyle(
                        color: Color(0xFFE71313),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 220,
                    height: 3,
                    color: const Color(0xFFE71313),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 44),
                    width: 220,
                    height: 3,
                    color: const Color(0xFF011A41),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    child: const Image(
                      height: 175,
                      width: 155,
                      image: AssetImage("assets/images/img.png"),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Stack(
                                    clipBehavior: Clip.none,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40,
                                        top: -40,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.close),
                                          ),
                                        ),
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF011A41)),
                                                        ),
                                                        labelText: "Nama",
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFF011A41)),
                                                        ),
                                                        labelText: "Nomor Meja",
                                                        labelStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8, left: 8, top: 30),
                                              child: SizedBox(
                                                height: 40,
                                                width: 230,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFF011A41),
                                                  ),
                                                  child: const Text(
                                                    'Masuk',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Jost_Regular",
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Home()),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 2.0,
                          color: Color(0xFF011A41),
                        ),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(28),
                        backgroundColor:
                            const Color(0xFFD8D8D8), // <-- Button color
                        foregroundColor:
                            const Color(0xFF011A41), // <-- Splash color
                      ),
                      child: const Icon(Icons.qr_code_scanner_outlined,
                          color: Color(0xFF011A41)),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: -165,
            child: Image(
              height: 168,
              width: 400,
              image: AssetImage("assets/images/icon2.png"),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: -165,
            child: Image(
              height: 168,
              width: 400,
              image: AssetImage("assets/images/icon2.png"),
            ),
          ),
          const Positioned(
            bottom: -60,
            right: -50,
            child: Image(
              height: 168,
              width: 400,
              image: AssetImage("assets/images/icon3.png"),
            ),
          ),
        ],
      ),
    );
  }
}
