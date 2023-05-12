import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:fixitpro/common/widgets/widgets.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/services/user_register_service.dart';
import 'package:fixitpro/features/user/ui/background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAddressPage extends StatelessWidget {
  const RegisterAddressPage({super.key});

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
              Text('Registro 3/3',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => RegisterFormProvider(), child: _RegisterForm())
            ],
          )),
      const SizedBox(height: 50),
    ]))));
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  _registerAction(context, RegisterFormProvider registerForm) async {
    final userService = Provider.of<UserService>(context, listen: false);
    FocusScope.of(context).unfocus();

    if (!registerForm.isValidForm()) return;

    registerForm.isLoading = true;
    userService.user =
        userService.user!.copyWith(addresses: registerForm.addresses);
    safePrint(userService.user);
    final response = await userService.createUser(registerForm);

    if (response.data != null) {
      safePrint('Register success');
      Navigator.pushReplacementNamed(context, '/register-success');
    } else {
      safePrint('Register error');
      //TODO: Show message Tryagain
    }
    registerForm.isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    final userService = Provider.of<UserService>(context, listen: false);
    return Form(
      key: registerForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AutofillGroup(
        child: Column(
          children: [
            Text(
              '${userService.user!.firstName}Puedes agregar tantas direcciones como quieras, vamos a donde quieras! Agrega Datos como ciudad, barrio, No.Apartamento.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ListView.builder(
                shrinkWrap: true,
                itemCount: registerForm.addresses!.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            key: Key('address$index'),
                            textInputAction: TextInputAction.next,
                            enableSuggestions: true,
                            autocorrect: false,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                hintText: 'Escribe aquí una direccion',
                                labelText:
                                    'Dirección ${index != 0 ? index + 1 : "Principal"}',
                                suffixIcon: index != 0
                                    ? InkWell(
                                        child:
                                            const Icon(Icons.delete, size: 24),
                                        onTap: () {
                                          registerForm.removeAddress(index);
                                        })
                                    : const SizedBox()),
                            onChanged: (value) {
                              registerForm.updateAddress(index, value);
                            },
                            validator: (value) {
                              if (value == '') return 'Este campo es requerido';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.add,
                  color: AppTheme.primary,
                ),
                TextButton(
                    onPressed: () {
                      registerForm.addNewFieldAddress();
                    },
                    child: const Text('Agregar dirección')),
              ],
            ),
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
