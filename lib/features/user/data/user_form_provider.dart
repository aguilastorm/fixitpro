import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  DateTime _dateOfBirth = DateTime.now();
  List<String>? _addresses = [''];
  bool _isLoading = false;

  String get firstName => _firstName;
  String get lastName => _lastName;
  DateTime get dateOfBirth => _dateOfBirth;
  List<String>? get addresses => _addresses;
  bool get isLoading => _isLoading;

  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  addNewFieldAddress() {
    List<String> mutableAddresses = List<String>.from(_addresses!);
    mutableAddresses.add('');
    _addresses = mutableAddresses;
    notifyListeners();
  }

  updateAddress(index, address) {
    _addresses![index] = address;
    notifyListeners();
  }

  removeAddress(int index) {
    List<String> mutableAddresses = List<String>.from(_addresses!);
    mutableAddresses.removeAt(index);
    _addresses = mutableAddresses;
    notifyListeners();
  }
}
