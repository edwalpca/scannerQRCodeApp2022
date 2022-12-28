import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/models/scanmodel.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';
import 'package:tsw_scanner_app/utils/utils.dart';

class CustomListViewItem extends StatelessWidget {
  
  //Propiedades de mi Widget.
  final IconData icon;

  const CustomListViewItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);

    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        //itemCount: 20,
        itemBuilder: (_, i) => Dismissible(
              background: Container(
                color: Colors.red,
              ),
              key: UniqueKey(),
              onDismissed: (DismissDirection direction) {
                scanListProvider.borrarScanPorId(scans[i].id!.toInt());
              },
              child: ListTile(
                leading: Icon(icon, color: Theme.of(context).primaryColor),
                title: Text(scans[i].valor),
                subtitle: Text('ID: ${scans[i].id} Date:${scans[i].fecha}'),
                trailing:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: () => launchUrlFunction(context, scans[i])
              ),
            ));
  }
}
