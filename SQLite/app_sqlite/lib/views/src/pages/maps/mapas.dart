import 'package:flutter/material.dart';

class MapasPage extends StatelessWidget {
  final String qrCodeResult;
  const MapasPage(this.qrCodeResult, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Mapas Pages $qrCodeResult'),
    );
  }
}
