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

class RegisterBirthDatePage extends StatelessWidget {
  const RegisterBirthDatePage({super.key});

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
              Text('Registro 2/3',
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
  final TextEditingController _dateController = TextEditingController();
  _registerAction(context, RegisterFormProvider registerForm) async {
    final userService = Provider.of<UserService>(context, listen: false);
    FocusScope.of(context).unfocus();

    if (!registerForm.isValidForm()) return;

    registerForm.isLoading = true;
    userService.user = userService.user!
        .copyWith(dateOfBirth: TemporalDateTime(registerForm.dateOfBirth));
    safePrint(userService.user);
    Navigator.pushReplacementNamed(context, '/register-address');

    registerForm.isLoading = false;
  }

  Future<void> _selectDate(BuildContext context) async {
    final registerForm =
        Provider.of<RegisterFormProvider>(context, listen: false);
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
    final userService = Provider.of<UserService>(context, listen: false);
    safePrint(registerForm.firstName);
    return Form(
      key: registerForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: AutofillGroup(
        child: Column(
          children: [
            Text(
                '${userService.user!.firstName}! cual es tu fecha de cumpleaños, porque nos encantaria celebrarlo ofreciendo descuentos especiales de revision temprana.'),
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
