import 'package:amplify_api/amplify_api.dart';
import 'package:fixitpro/fixitpro_app.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'amplifyconfiguration.dart';

import 'models/ModelProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await _configureAmplify();
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }

  runApp(const AppState());
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAPI(modelProvider: ModelProvider.instance),
  ]);
  await Amplify.configure(amplifyconfig);
}
