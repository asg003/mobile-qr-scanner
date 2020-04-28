import 'package:backtoschool/navigation/router.dart';
import 'package:backtoschool/views/QR_scanner_view.dart';
import 'package:backtoschool/views/SSO_view.dart';
import 'package:flutter/material.dart';
import 'package:backtoschool/app_theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data_provider/provider_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeStorage();

  runApp(TabBarApp());
}

void initializeStorage() async {
  /// initialize hive storage
  Hive.initFlutter('.');

  if (await isFirstRun()) {
    FlutterSecureStorage storage = FlutterSecureStorage();

    /// delete any saved data
    await Hive.deleteFromDisk();
    await storage.deleteAll();
    setFirstRun();
  }
}

Future<bool> isFirstRun() async {
  final prefs = await SharedPreferences.getInstance();
  return (prefs.getBool('first_run') ?? true);
}

void setFirstRun() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('first_run', false);
}

class TabBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: ColorPrimary,
          accentColor: lightAccentColor,
          brightness: Brightness.light,
          buttonColor: lightButtonColor,
          textTheme: lightThemeText,
          iconTheme: lightIconTheme,
          appBarTheme: lightAppBarTheme,
        ),
        darkTheme: ThemeData(
          primarySwatch: ColorPrimary,
          accentColor: darkAccentColor,
          brightness: Brightness.dark,
          buttonColor: darkButtonColor,
          textTheme: darkThemeText,
          iconTheme: darkIconTheme,
          appBarTheme: darkAppBarTheme,
        ),
        home: SSOLoginView(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
