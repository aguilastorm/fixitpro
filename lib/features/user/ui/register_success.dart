import 'package:fixitpro/common/widgets/card_container.dart';
import 'package:fixitpro/features/user/ui/background.dart';
import 'package:flutter/material.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});
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
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Se han registrado tus datos exitosamente.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                        'Enviaremos un tecnico de manera preventiva sin costo a tu dirección principal para evaluar el estado de tus electrodomesticos.'),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      child: const Text('Quiero registrar alguien mas!'),
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
