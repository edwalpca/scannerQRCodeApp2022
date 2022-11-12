// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {

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
    // Le digo a todos los widgets que estan escuchando que hay 
    // que hacer algo
    notifyListeners();
  }


}
