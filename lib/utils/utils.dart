import 'package:flutter/material.dart';
import 'package:tsw_scanner_app/models/scanmodel.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunction(BuildContext context, ScanModel scan) async {
  //
  //
  final url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    //Abrir el Sitio Web
    
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }

  } else {

    //Abro la pantalla del Mapa de Google.
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }


}
