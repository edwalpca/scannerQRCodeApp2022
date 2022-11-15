// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  //propipedades de la clase.
  int? id;
  String? tipo;
  String valor;
  String fecha;

  //Constructor de la clase.
  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
    required this.fecha
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }
  //
  //
  //
  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
        fecha: json["fecha"],
      );
  //
  //
  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
        "fecha": fecha
      };
}
