import 'package:app_sqlite/views/src/pages/direccion/direccion.dart';
import 'package:app_sqlite/views/src/pages/maps/mapas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currenIndex = 0;
  String qrCodeResult = "Escanea un código QR";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Scanner',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_forever),
            color: Colors.red,
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _callPage(currenIndex, qrCodeResult),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          // Navegar a la pantalla de escaneo de QR y esperar el resultado
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRViewExample()),
          );

          // Si se obtiene un resultado, actualizar el texto
          if (result != null) {
            setState(() {
              qrCodeResult = result;
            });
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _callPage(int paginaActual, String qrCodeResult) {
    switch (paginaActual) {
      case 0:
        return MapasPage(qrCodeResult);
      case 1:
        return DireccionPage(qrCodeResult);
      default:
        return const Center(
          child: Text('Not pages'),
        );
    }
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currenIndex,
      onTap: (value) {
        setState(() {
          currenIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapas'),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions), label: 'Direccion')
      ],
    );
  }
}



class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrCodeResult;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escanear Código QR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Volver a la pantalla anterior con el resultado escaneado
                  Navigator.pop(context, qrCodeResult);
                  print("-----------------------");
                  print(qrCodeResult);
                },
                child: Text('Volver con resultado'),
              ),
            ),
          ),
          //Center(child: Text(qrCodeResult!),)
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrCodeResult = scanData.code;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
