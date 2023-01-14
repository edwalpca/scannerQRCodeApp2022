// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';



// Provider unicamente para gestionar la opcion de CustomBottomNavigationBar
// De manera que cuando el usuario Da click a una opcion u la otra
// Notifica a los demas Widgets para actualizar lo que se tenga que actualizar.
// en el arbol de widgets
class UiProvider extends ChangeNotifier {
  
  // Por defecto la opcion seleccionada cuando inicia el App es la opcion 0
  // de mapas.
  int _selectedMenuOpt = 0;

  //Getters
  //Opcion corta
  //get selectedMenuOpt => selectedMenuOpt;
  //Opcion de bloque
  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int valor) {
    _selectedMenuOpt = valor;
    //print(_selectedMenuOpt);
    // Le digo a todos los widgets que estan escuchando que hay
    // que hacer algo
    notifyListeners();
  }
}
