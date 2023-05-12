import 'package:fixitpro/common/widgets/card_container.dart';
import 'package:fixitpro/features/user/ui/background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              CardContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'FixItPro',
                      style: TextStyle(fontSize: 40),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      '¡Nunca dejes que un electrodoméstico roto arruine tu día! Con FixItPro, solicitar la reparación de electrodomésticos a domicilio es tan fácil como pulsar un botón. Regístrate, agrega tus direcciones y solicita servicios de reparación directamente desde tu teléfono.',
                    ),
                    const SizedBox(height: 50),
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
            ],
          ),
        ),
      ),
    );
  }
}
