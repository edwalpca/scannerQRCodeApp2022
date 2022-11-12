import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomfloatingActionButton extends StatelessWidget {

  //Constructor del Widget
  const CustomfloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.scanner_rounded),
        onPressed: () async {
          // print('Dieron Click en el FloatingActionButton ');
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF', 'Cancealr', false, ScanMode.QR);
          //
          print(barcodeScanRes);

        });
  }
}
