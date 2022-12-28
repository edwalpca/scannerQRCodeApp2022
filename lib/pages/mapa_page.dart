import 'dart:async';

import 'package:flutter/material.dart';

import '../providers/db_provider.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_floating_action_button.dart';
//
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  //Controlador de Google Maps
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    //

    const CameraPosition puntoInicial2 = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    //
    //

    //Esta instruccion es para recibir parametros de otra pantalla.
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    //Codigo optimizado en el scanmodel.dart
    //    final cordenadas = scan.valor.split(',');
    //    final lat = double.parse(cordenadas[0].replaceAll('geo:', ''));
    //    final lgn = double.parse(cordenadas[1].replaceAll(' ', ''));
    //    print("==============================================");
    //    print(lat);
    //    print("== ");
    //    print(lgn);
    //    print("==============================================");

    final CameraPosition puntoInicial = CameraPosition(
      //target: LatLng(lat, lgn),
      target: scan.getLatLng(),
      zoom: 17,
      tilt: 50
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Coordenadas del Mapa')),
      //Construccion del Mapa en la Pantalla.
      body: GoogleMap(
        //mapType: MapType.hybrid,
        mapType: MapType.normal,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      //Botones de Abajo
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const CustomfloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
