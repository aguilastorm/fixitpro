import 'package:fixitpro/common/widgets/card_container.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/common/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
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
                    Text(
                      registerForm.firstName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
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
                    Text(
                      'Enviaremos un tecnico de manera preventiva sin costo a tu dirección principal (${registerForm.addresses![0]}) para evaluar el estado de tus electrodomesticos.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      child: const Text('Quiero registrar alguien mas!'),
                      onPressed: () {
                        registerForm.clearForm();
                        Navigator.pushReplacementNamed(context,
                            '/'); // This will navigate to RegisterPage when tapped
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
