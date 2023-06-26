import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'infrastructure/config/build_config.dart';
import 'infrastructure/config/env_config.dart';
import 'infrastructure/config/environment.dart';


class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      EnvConfig devConfig = EnvConfig(
        appName: "Tucktec",
        baseUrl: '',
        baseUrlGooglePlace: '',
        shouldCollectCrashLog: true,
      );
      BuildConfig.instantiate(
        envType: Environment.development,
        envConfig: devConfig,
      );

      _initScreenPreference();
      // database;
    } catch (err) {
      rethrow;
    }
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
