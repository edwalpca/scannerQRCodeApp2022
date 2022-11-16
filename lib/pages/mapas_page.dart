import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';

class MaposPage extends StatelessWidget {
  const MaposPage({super.key});

  @override
  Widget build(BuildContext context) {

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        //itemCount: 20,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
              title: const Text('http://www.mauricio.com'),
              subtitle: const Text('ID: 1'),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: () => print('Abrir algo aqui....'),
            ));
  }
}