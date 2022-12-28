import 'package:flutter/material.dart';
import 'package:tsw_scanner_app/widgets/custom_listview_items.dart';

class MapasContentPage extends StatelessWidget {
  const MapasContentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CustomListViewItem(icon: Icons.location_on);
  }
}
