import 'dart:async';
import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:fixitpro/common/widgets/widgets.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/common/widgets/background.dart';
import 'package:fixitpro/common/widgets/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
            child: SingleChildScrollView(
                child: Column(children: [
      const SizedBox(height: 100),
      CardContainer(
          width: 500,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text('Registro',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 30),
              _RegisterForm()
            ],
          )),
      const SizedBox(height: 50),
    ]))));
  }
}

class _RegisterForm extends StatelessWidget {


  final TextEditingController _dateController = TextEditingController();
  _saveRegisterAction(context, RegisterFormProvider registerForm) async {
    FocusScope.of(context).unfocus();
    if (!registerForm.isValidForm()) return;

    // registerForm.isLoading = true;
    Navigator.pushReplacementNamed(context, '/register-confirmation');
    // registerForm.isLoading = false;
  }

  Future<void> _selectDate(
      BuildContext context, RegisterFormProvider registerForm) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: registerForm.dateOfBirth,
        currentDate: registerForm.dateOfBirth,
        firstDate: DateTime(1900, 1, 1), // Set to a date in the distant past
        lastDate: DateTime.now());
    if (picked != null && picked != registerForm.dateOfBirth) {
      registerForm.dateOfBirth = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    _dateController.text =
        DateFormat('dd/MM/yyyy').format(registerForm.dateOfBirth);
    return Form(
      key: registerForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AutofillGroup(
        child: Column(
          children: [
            TextFormField(
              key: const Key('firstName'),
              initialValue: registerForm.firstName,
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
              initialValue: registerForm.lastName,
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
            TextFormField(
              key: const Key('dateOfBirth'),
              textInputAction: TextInputAction.next,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.text,
              controller: _dateController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Selecciona tu fecha de nacimiento',
                  labelText: 'Fecha de nacimiento'),
              onTap: () async {
                FocusScope.of(context)
                    .requestFocus(FocusNode()); // to dismiss the keyboard
                await _selectDate(context, registerForm);
                _dateController.text =
                    DateFormat('dd/MM/yyyy').format(registerForm.dateOfBirth);
              },
              onChanged: (value) {
                value =
                    DateFormat('dd/MM/yyyy').format(registerForm.dateOfBirth);
              },
              validator: (value) {
                if (value == '') return 'Este campo es requerido';
                return null;
              },
            ),
            // const SizedBox(height: 24),

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
                            initialValue: registerForm.addresses![index],
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
                              registerForm.addresses![index] = value;
                            },
                            validator: (value) {
                              if (value!.length < 20) {
                                return 'Completa la dirección (Ciudad, Barrio, No. Apto)';
                              }
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
                    key: const Key('addAddressButton'),
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
                        _saveRegisterAction(context, registerForm);
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
