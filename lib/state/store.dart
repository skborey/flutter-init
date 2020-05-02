import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './app_state.dart';
import './reducer.dart';

// store that hold our current appstate
final store = new Store<AppState>(reducer,
    initialState: new AppState(0, "", ""), middleware: [thunkMiddleware]);
