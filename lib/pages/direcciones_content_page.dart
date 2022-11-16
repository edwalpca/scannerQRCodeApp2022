import 'package:flutter/material.dart';
import 'package:tsw_scanner_app/pages/mapas_page.dart';

class DireccionesContentPage extends StatelessWidget {
   
  const DireccionesContentPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Center(
      //    child: Text('Direcciones Content Page'),
      // ),
      body: MaposPage(),
    );
  }
}