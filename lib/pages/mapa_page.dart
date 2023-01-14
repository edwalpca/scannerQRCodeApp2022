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
  final Completer<GoogleMapController> _controller = Completer();

  MapType mapType = MapType.normal;

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
        zoom: 14,
        tilt: 50);
    //Marcadores.
    Set<Marker> markers = <Marker>{};

    markers.add(Marker(
      markerId: const MarkerId('geoLocation'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordenadas del Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getLatLng(), zoom: 14, tilt: 50),
                ));
              },
              icon: const Icon(Icons.location_searching))
        ],
      ),
      //Construccion del Mapa en la Pantalla.
      body: GoogleMap(
        //mapType: MapType.hybrid,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      //
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          setState(() {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
          });
        },
      ),
      //Botones de Abajo
      //bottomNavigationBar: const CustomBottomNavigationBar(),
      //floatingActionButton: const CustomfloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
