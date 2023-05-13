import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:fixitpro/common/widgets/widgets.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/services/user_register_service.dart';
import 'package:fixitpro/features/user/ui/background.dart';
import 'package:fixitpro/features/user/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/User.dart';

class RegisterNamePage extends StatelessWidget {
  const RegisterNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
            child: SingleChildScrollView(
                child: Column(children: [
      const SizedBox(height: 200),
      CardContainer(
          width: 500,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text('Registro 1/3',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 30),
              const _RegisterForm()
            ],
          )),
      const SizedBox(height: 50),
    ]))));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  _registerAction(context, RegisterFormProvider registerForm) async {
    // final userService = Provider.of<UserService>(context, listen: false);
    FocusScope.of(context).unfocus();

    if (!registerForm.isValidForm()) return;

    registerForm.isLoading = true;
    safePrint(registerForm.firstName);
    // userService.user = userService.user!.copyWith(
    //     firstName: registerForm.firstName, lastName: registerForm.lastName);
    // safePrint(userService.user);
    Navigator.pushReplacementNamed(context, '/register-birthdate');
    registerForm.isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);

    return Form(
      key: registerForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AutofillGroup(
        child: Column(
          children: [
            const Text(
                'Queremos conocerte...y que el servicio sea personalizado, completa los siguentes datos:'),
            TextFormField(
              key: const Key('firstName'),
              textInputAction: TextInputAction.next,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Escribe aquí tu nombre', labelText: 'Nombres'),
              onChanged: (value) {
                registerForm.firstName = value;
              },
              validator: (value) {
                if (value == '') return 'Este campo es requerido';
                return null;
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              key: const Key('lastName'),
              textInputAction: TextInputAction.next,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Escribe aquí tus apellidos',
                  labelText: 'Apellidos'),
              onChanged: (value) {
                registerForm.lastName = value;
              },
              validator: (value) {
                if (value == '') return 'Este campo es requerido';
                return null;
              },
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 30),
            MaterialButton(
                key: const Key('submitButton'),
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
                      registerForm.isLoading ? 'Espere' : 'Continuar',
                      style: const TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
