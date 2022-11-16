import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/constantes.dart';
import 'package:tsw_scanner_app/pages/direcciones_content_page.dart';
import 'package:tsw_scanner_app/pages/mapas_content_page.dart';
import 'package:tsw_scanner_app/providers/db_provider.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';
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

    // TODO: Temporal leer la base de datos
    //Estoy llamando la base de datos
    //DBProvider.db.database;

    // Coloco el listen en False porque aqui no se tienen que redibujar
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    //
    //Ejemplo de Insertar en la base de datos.
    //final now = DateTime.now();
    //DateTime date = DateTime(
    //  now.year, now.month, now.day, now.hour, now.minute, now.second);
    // final tempScan =
    //     ScanModel(valor: 'http://mauricioalpizar.com', fecha: dateGlobalSystem.toString());
    //DBProvider.db.nuevoScan(tempScan);

    // Obtiene un reistro partilcar de la base de datos.
    //DBProvider.db.getScanById(10).then((scan) => print(scan!.valor.toString()));
    //DBProvider.db.getRowporValor('mau').then((scan) => print(scan));

    switch (currentIndexSelected) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return const MapasContentPage();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return const DireccionesContentPage();

      //Contenido por defecto cuando carga la pantalla
      default:
        scanListProvider.cargarScanPorTipo('geo');
        return const MapasContentPage();
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
        return const IconoActivo(childIcon: Icons.http_outlined);
      //Contenido por defecto cuando carga la pantalla
      default:
        return const IconoActivo(childIcon: Icons.http_outlined);
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

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: true);

    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              childIcon,
              size: 32,
            )),
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {


                print(scanListProvider.tipoSeleccionado.toString());


                scanListProvider.borrarScanPorTipo(
                                        scanListProvider.tipoSeleccionado.toString());

              },

              child: const Icon(
                Icons.delete,
                size: 32,
              ),
            )),
      ],
    );
  }
}
