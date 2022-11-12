import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_floating_action_button.dart';


class MapaPage extends StatelessWidget {

  const MapaPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
       title: const Text('Mapa -Page-')),
      body: const Center(
        child: Text('Mapa -Page-'),
     ),
     
     bottomNavigationBar: const CustomBottomNavigationBar(),
     floatingActionButton: const CustomfloatingActionButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

   );
  }
}