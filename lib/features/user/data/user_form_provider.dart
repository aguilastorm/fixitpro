import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  TemporalDateTime dateOfBirth = TemporalDateTime(DateTime.now());
  List<String>? addresses = [''];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
