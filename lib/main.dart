import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './state/app_state.dart';
import './state/store.dart';
import './state/test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => new MyHomePage(title: 'Flutter Demo Home Page'),
        },
      ),
    );
  }
}
