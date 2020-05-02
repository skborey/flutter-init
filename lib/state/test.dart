import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './action.dart' as Action;
import './app_state.dart';
import './thunk_action.dart';

typedef void IncrementCounter(); // This is sync. call back function
typedef void GenerateQuote(); // This is async.

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState, int>(
              converter: (store) => store.state.counter,
              builder: (_, counter) {
                return new Text(
                  '$counter',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),

            // display random quote and its author
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (_, state) {
                return new Text(
                  ' ${state.quote} \n -${state.author}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0),
                );
              },
            ),

            // generate quote button
            StoreConnector<AppState, GenerateQuote>(
              converter: (store) => () => store.dispatch(getRandomQuoteAPI),
              builder: (_, generateQuoteCallback) {
                return new FlatButton(
                    color: Colors.lightBlue,
                    onPressed: generateQuoteCallback,
                    child: new Text("generate random quote"));
              },
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<AppState, IncrementCounter>(
        converter: (store) =>
            () => store.dispatch(Action.Actions.IncrementAction),
        builder: (_, incrementCallback) {
          return new FloatingActionButton(
            onPressed: incrementCallback,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
