import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:flutter/material.dart';
import '../../../models/User.dart';

class UserService extends ChangeNotifier {
  User? _user = User(
      firstName: '',
      lastName: '',
      dateOfBirth: TemporalDateTime(DateTime.now()),
      addresses: const ['']);
  User? get user => _user;

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  Future<GraphQLResponse<User>> createUser(RegisterFormProvider user) async {
    final newUser = User(
        firstName: user.firstName,
        lastName: user.lastName,
        dateOfBirth: TemporalDateTime(user.dateOfBirth),
        addresses: user.addresses);
    final request = ModelMutations.create(newUser);
    final response = await Amplify.API.mutate(request: request).response;
    _user = newUser;
    notifyListeners();
    return response;
  }
}
