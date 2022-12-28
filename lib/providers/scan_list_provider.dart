import 'package:flutter/material.dart';
import 'package:tsw_scanner_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  //Propiedades de mi Provider.
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor, String fecha) async {
    final nuevoScan = ScanModel(valor: valor, fecha: fecha);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      //Agrego mi objeto a la lista de scans.
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllRows();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getAllRowporTipo(tipo);
    this.scans = [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScanPorTipo(tipoSeleccionado);
    //notifyListeners();
  }

  borrarScanPorTipo(String tipo) async {
    await DBProvider.db.deleteScanPorTipo(tipo);
    cargarScanPorTipo(tipoSeleccionado);
    //notifyListeners();
  }
}
