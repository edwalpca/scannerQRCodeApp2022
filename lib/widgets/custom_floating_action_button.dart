import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/constantes.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';
import 'package:tsw_scanner_app/utils/utils.dart';

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
          //const barcodeScanRes = 'http://www.google.com';
          const barcodeScanRes = 'geo:10.005002, -84.140475';
          
          //Coloco esta validacion porque esta relacionada a si el usuario
          //Cancelo la operacion del scaneo
          if (barcodeScanRes == '-1') {
            return;
          }

          // scanListProvider.nuevoScan(
          //     'http://www.mauricioalpizar.com', dateGlobalSystem.toString());
          //  scanListProvider.nuevoScan(
          //      'geo://10.005002, -84.140475', dateGlobalSystem.toString());

          final nuevoScan = await scanListProvider.nuevoScan(
              barcodeScanRes, dateGlobalSystem.toString());

          // ignore: use_build_context_synchronously
          launchUrlFunction(context, nuevoScan);

          // print('Dieron Click en el FloatingActionButton ');
          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          //
          //print(barcodeScanRes);
        });
  }
}
