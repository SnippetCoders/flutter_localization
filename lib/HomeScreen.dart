
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localizations/app_language.dart';
import 'localizations/app_localizations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(AppLocalizations.of(context).translate("AppTitle"))),
        body: Container(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _englishButton(context),
                _hindiButton(context)
              ]),
        )));
  }

  Widget _englishButton(BuildContext context) {
    return new FlatButton(
      onPressed: () {
        _setAppLng("English", context);
      },
      textColor: Colors.black,
      color: Colors.redAccent,
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        "English",
      ),
    );
  }

  Widget _hindiButton(BuildContext context) {
    return new FlatButton(
      onPressed: () {
        _setAppLng("Hindi", context);
      },
      textColor: Colors.white,
      color: Colors.blue,
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        "Hindi",
      ),
    );
  }

  void _setAppLng(String lngName, BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context, listen: false);

    switch (lngName) {
      case 'English':
        appLanguage.changeLanguage(Locale("en"));
        break;
      case 'Hindi':
        appLanguage.changeLanguage(Locale("hi"));
        break;
      default:
        appLanguage.changeLanguage(Locale("en"));
    }
  }
}

