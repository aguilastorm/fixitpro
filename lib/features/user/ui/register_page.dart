import 'dart:async';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:fixitpro/common/widgets/widgets.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/services/user_register_service.dart';
import 'package:fixitpro/features/user/ui/background.dart';
import 'package:fixitpro/features/user/ui/input_decorations.dart';
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
  String _registerMessage = '';
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  _registerAction(context, registerForm) async {
    FocusScope.of(context).unfocus();
    final userRegisterService =
        Provider.of<UserRegisterService>(context, listen: false);

    if (!registerForm.isValidForm()) return;

    registerForm.isLoading = true;
    // TODO: Accion before validation
    registerForm.isLoading = false;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        currentDate: _selectedDate,
        firstDate: DateTime(1900, 1, 1), // Set to a date in the distant past
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      setState(() {});
    }
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
            Text(_registerMessage, style: const TextStyle(color: Colors.red)),
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
                _registerMessage = '';
                setState(() {});
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
                registerForm.firstName = value;
                _registerMessage = '';
                setState(() {});
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
                await _selectDate(context);
                _dateController.text =
                    DateFormat('dd/MM/yyyy').format(_selectedDate);
              },
              onChanged: (value) {
                value = DateFormat('dd/MM/yyyy').format(_selectedDate);
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
                              registerForm.firstName = value;
                              _registerMessage = '';
                              setState(() {});
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
                      registerForm.addAddress();
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
