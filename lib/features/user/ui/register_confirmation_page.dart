import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:fixitpro/common/widgets/widgets.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/services/user_register_service.dart';
import 'package:fixitpro/common/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterConfirmationPage extends StatelessWidget {
  const RegisterConfirmationPage({super.key});

  _registerAction(context, RegisterFormProvider registerForm) async {
    FocusScope.of(context).unfocus();
    UserRegisterService userService = UserRegisterService();
    registerForm.isLoading = true;
    final response = await userService.registerUser(registerForm);
    if (response.data != null) {
      safePrint('Register success');
      Navigator.pushReplacementNamed(context, '/register-success');
      registerForm.isLoading = false;
    } else {
      safePrint('Register error');

      registerForm.isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerForm =
        Provider.of<RegisterFormProvider>(context, listen: true);
    safePrint(registerForm.firstName);
    return Scaffold(
        body: Background(
            child: SingleChildScrollView(
                child: Column(children: [
      const SizedBox(height: 150),
      CardContainer(
          width: 500,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text('Confirmar Registro', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 30),
              ListTile(
                title:
                    Text('${registerForm.firstName} ${registerForm.lastName}'),
                trailing: const Icon(Icons.person),
                subtitle: const Text('Nombre completo'),
              ),
              ListTile(
                title: Text(
                    DateFormat('dd/MM/yyyy').format(registerForm.dateOfBirth)),
                trailing: const Icon(Icons.date_range),
                subtitle: const Text('Fecha de nacimiento'),
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                width: 400,
                height: 200,
                child: ListView.builder(
                    itemCount: registerForm.addresses!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(registerForm.addresses![index]),
                        trailing: const Icon(Icons.location_on),
                        subtitle: Text(
                            'Dirección ${index != 0 ? index + 1 : "Principal"}'),
                      );
                    }),
              ),
              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 16,
              ),
              MaterialButton(
                  key: const Key('aceptar'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: AppTheme.primary,
                  onPressed: registerForm.isLoading
                      ? null
                      : () {
                          _registerAction(context, registerForm);
                        },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      child: Text(
                        registerForm.isLoading ? 'Espere' : 'Aceptar',
                        style: const TextStyle(color: Colors.white),
                      ))),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.edit_note_sharp,
                    color: AppTheme.primary,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: const Text('Corregir Datos')),
                ],
              ),
            ],
          )),
      const SizedBox(height: 50),
    ]))));
  }
}
