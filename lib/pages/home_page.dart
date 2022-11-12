import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/pages/direcciones_content_page.dart';
import 'package:tsw_scanner_app/pages/mapas_content_page.dart';
import 'package:tsw_scanner_app/providers/ui_provider.dart';
import 'package:tsw_scanner_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:tsw_scanner_app/widgets/custom_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: const <Widget>[CustomActionsAppBar()],
      ),
      body: _ContentPage(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const CustomfloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Voy a Obtener el valor de mi provider.
    final uiProviderIndex = Provider.of<UiProvider>(context).selectedMenuOpt;
    final int currentIndexSelected = uiProviderIndex;

    switch (currentIndexSelected) {
      case 0:
        return const DireccionesContentPage();
      case 1:
        return const MapasContentPage();
      //Contenido por defecto cuando carga la pantalla
      default:
        return const DireccionesContentPage();
    }
  }
}

class CustomActionsAppBar extends StatelessWidget {
  
  const CustomActionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Voy a Obtener el valor de mi provider.
    final uiProviderIndex = Provider.of<UiProvider>(context).selectedMenuOpt;
    final int currentIndexSelected = uiProviderIndex;

    switch (currentIndexSelected) {
      case 0:
        return const IconoActivo(childIcon: Icons.map_sharp);
      case 1:
        return const IconoActivo(childIcon: Icons.scanner_outlined);
      //Contenido por defecto cuando carga la pantalla
      default:
        return const IconoActivo(childIcon: Icons.scanner_outlined);
    }
  }
}

//Widget que muestra en el AppBar el icono de la acccion seleccionada
// segun el BottomNavigation Bar
class IconoActivo extends StatelessWidget {

  final IconData childIcon;
  const IconoActivo({super.key, required this.childIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10), child: Icon(childIcon,size: 32,));
  }
}
