import 'package:flutter/material.dart';
import 'package:tsw_scanner_app/pages/home_page.dart';
import 'package:tsw_scanner_app/pages/mapa_page.dart';
import 'package:provider/provider.dart';
import 'package:tsw_scanner_app/providers/scan_list_provider.dart';
import 'package:tsw_scanner_app/providers/ui_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UiProvider()),
      ChangeNotifierProvider(create: (_) => ScanListProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner 2022',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'mapa': (_) => const MapaPage(),
      },
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple)),
    );
  }
}