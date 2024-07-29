import 'package:flutter/material.dart';
import 'package:kitchen_ui/features/map/map_screen.dart';

class openStreetMapExample extends StatelessWidget {
  const openStreetMapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}