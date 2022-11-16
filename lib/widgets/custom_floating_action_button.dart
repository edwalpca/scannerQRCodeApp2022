import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/constantes.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';

class CustomfloatingActionButton extends StatelessWidget {
  //Constructor del Widget
  const CustomfloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Coloco el listen en False porque aqui no se tienen que redibujar
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    return FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.scanner_rounded),
        onPressed: () async {
          
          //final barcodeScanRes = 'http://www.google.com';

          scanListProvider.nuevoScan(
              'http://mauricio-alpizar.com', dateGlobalSystem.toString());


          // scanListProvider.nuevoScan(
          //     'geo://15.33,15.66', dateGlobalSystem.toString());              

          // print('Dieron Click en el FloatingActionButton ');
          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          //
          //print(barcodeScanRes);
        });
  }
}
