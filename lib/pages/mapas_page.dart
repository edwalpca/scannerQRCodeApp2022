import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';

class MaposPage extends StatelessWidget {

  const MaposPage({super.key});

  @override
  Widget build(BuildContext context) {

    
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);

    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        //itemCount: 20,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text('ID: ${scans[i].id} Date:${scans[i].fecha}'),
              trailing:
                  const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: () => print('Abrir algo aqui....'),
            ));
  }
}
