import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';
import 'localizations/app_language.dart';
import 'localizations/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
            create: (_) => this.widget.appLanguage,
            child: Consumer<AppLanguage>(builder: (context, model, child) {
              return MaterialApp(
                  locale: model.appLocale,
                  title: '',
                  supportedLocales: [
                    Locale('en', 'US'),
                    Locale('hi', ''),
                  ],
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  home: SafeArea(
                      bottom: false,
                      child: Scaffold(primary: false, body: HomePage())));
            }));
  }
}
