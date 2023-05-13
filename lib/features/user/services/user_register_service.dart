import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fixitpro/features/user/data/user_form_provider.dart';
import '../../../models/User.dart';

class UserRegisterService {

  Future<GraphQLResponse<User>> registerUser(RegisterFormProvider user) async {
    final newUser = User(
        firstName: user.firstName,
        lastName: user.lastName,
        dateOfBirth: TemporalDateTime(user.dateOfBirth),
        addresses: user.addresses);
    final request = ModelMutations.create(newUser);
    final response = await Amplify.API.mutate(request: request).response;
    return response;
  }
}
