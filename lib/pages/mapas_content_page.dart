import 'package:flutter/material.dart';
import 'package:tsw_scanner_app/pages/mapas_page.dart';

class MapasContentPage extends StatelessWidget {
  const MapasContentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Center(
      //    child: Text('Mapas Content Page'),
      // ),
      body: MaposPage(),
    );
  }
}
