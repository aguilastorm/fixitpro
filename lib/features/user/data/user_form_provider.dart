import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  TemporalDateTime dateOfBirth = TemporalDateTime(DateTime.now());

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<String>? _addresses = [''];
  List<String>? get addresses => _addresses;

  set addresses(List<String>? value) {
    _addresses = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  addAddress() {
    List<String> mutableAddresses = List<String>.from(_addresses!);
    mutableAddresses.add('');
    _addresses = mutableAddresses;
    notifyListeners();
  }
  removeAddress(int index) {
    List<String> mutableAddresses = List<String>.from(_addresses!);
    mutableAddresses.removeAt(index);
    _addresses = mutableAddresses;
    notifyListeners();
  }
}
