import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:mockito/mockito.dart';

class MockRegisterFormProvider extends Mock implements RegisterFormProvider {
  String _firstName = '';
  String _lastName = '';
  DateTime _dateOfBirth = DateTime.now();
  List<String>? _addresses = [''];
  bool _isLoading = false;

  @override
  String get firstName => _firstName;
  @override
  String get lastName => _lastName;
  @override
  DateTime get dateOfBirth => _dateOfBirth;
  @override
  List<String>? get addresses => _addresses;
  @override
  bool get isLoading => _isLoading;

  @override
  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  @override
  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  @override
  set dateOfBirth(DateTime value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  @override
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  addNewFieldAddress() {
    List<String> mutableAddresses = List<String>.from(_addresses!);
    mutableAddresses.add('');
    _addresses = mutableAddresses;
    notifyListeners();
  }

  @override
  updateAddress(index, address) {
    _addresses![index] = address;
    notifyListeners();
  }

  @override
  removeAddress(int index) {
    List<String> mutableAddresses = List<String>.from(_addresses!);
    mutableAddresses.removeAt(index);
    _addresses = mutableAddresses;
    notifyListeners();
  }

  @override
  clearForm() {
    _firstName = '';
    _lastName = '';
    _dateOfBirth = DateTime.now();
    _addresses = [''];
    _isLoading = false;
    notifyListeners();
  }
}
