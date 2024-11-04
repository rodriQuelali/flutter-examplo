import 'package:flutter/material.dart';

class DireccionPage extends StatelessWidget {
  final String qrCodeResult;
  const DireccionPage(this.qrCodeResult, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Direccion Pages $qrCodeResult'),
    );
  }
}
