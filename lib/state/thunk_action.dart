import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './app_state.dart';

ThunkAction<AppState> getRandomQuoteAPI = (Store<AppState> store) async {
  http.Response response = await http.get(
    Uri.encodeFull(
        'https://en.wikipedia.org/w/api.php?action=query&format=json&list=random&rnlimit=1'),
  );

  Map<String, dynamic> result = json.decode(response.body);
  print(result);
  String id = '123', word = 'onetwothree';
  if (response.statusCode == 200) {
    id = result['query']['random'][0]['id'].toString();
    word = result['query']['random'][0]['title'];
  }

  store.dispatch(new UpdateQuoteAction(word, id));
};
