import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/providers/ui_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Ubicacion al provider para tener acceso a la propiedad.
    //de Index Seleccionado.
    final uiProviderIndex = Provider.of<UiProvider>(context);
    final int currentItemSelected = uiProviderIndex.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentItemSelected,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(icon: Icon(Icons.http_outlined), label: 'Websites')
      ],
      onTap: (value) {
        //Este es el metodo Setter que tiene mi Provider
        uiProviderIndex.selectedMenuOpt = value;
      },
    );
  }
}
