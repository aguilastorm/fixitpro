import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FixItPro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '¡Nunca dejes que un electrodoméstico roto arruine tu día! Con FixItPro, solicitar la reparación de electrodomésticos a domicilio es tan fácil como pulsar un botón. Regístrate, agrega tus direcciones y solicita servicios de reparación directamente desde tu teléfono.',
            ),
            ElevatedButton(
              child: const Text('Quiero suscribirme!'),
              onPressed: () {
                Navigator.pushReplacementNamed(context,
                    '/register'); // This will navigate to RegisterPage when tapped
              },
            ),
          ],
        ),
      ),
    );
  }
}
