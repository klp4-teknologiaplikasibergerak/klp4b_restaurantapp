import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klp4b_restaurantapp/api/services.dart';
import 'package:klp4b_restaurantapp/providers/order_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  ApiService apiService = ApiService();
  final QtyController = TextEditingController();
  String namaMenu = '';
  String hargaMenu = '';
  late int idMenu;

  _fetchMenuData(String? barcode) async {
    try {
      final data = await apiService.fetchMenuData(barcode);
      for (Menu menu in data) {
        print('Id: ${menu.id}');
        setState(() {
          namaMenu = menu.name;
          hargaMenu = menu.price;
          idMenu = menu.id;
        });
        print(namaMenu);
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  updateState() {
    Provider.of<OrderProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              transform: Matrix4.translationValues(20.0, 12.0, 0.0),
              child: const Text(
                'Scan Menu',
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 20,
                  color: Color(0xFF011A41),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates,
                    ),
                    onDetect: (capture) async {
                      final List<Barcode> barcodes = capture.barcodes;
                      await _fetchMenuData(barcodes.lastOrNull?.rawValue);
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.white,
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFF011A41), width: 1.5),
                      bottom: BorderSide(color: Color(0xFF011A41), width: 1.5),
                      left: BorderSide(color: Color(0xFF011A41), width: 12.0),
                      right: BorderSide(color: Color(0xFF011A41), width: 1.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Nama Menu',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            namaMenu,
                            style: const TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        const Text(
                          'Harga',
                          style: TextStyle(
                            color: Color.fromARGB(255, 68, 75, 85),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          hargaMenu,
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    controller: QtyController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    enabled: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(width: 4),
                      ),
                      hintText: 'Qty',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, 28.0, 0.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF011A41)),
              child: const Text('Submit'),
              onPressed: () async {
                await apiService
                    .storeOrder(
                        menuId: idMenu,
                        tableId: 1,
                        customerName: 'Zulfiqry',
                        qty: int.parse(QtyController.text))
                    .then((value) => updateState());

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
