import './action.dart';
import './app_state.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action == Actions.IncrementAction) {
    AppState newAppState =
        new AppState(prev.counter + 1, prev.quote, prev.author);

    return newAppState;
  } else if (action is UpdateQuoteAction) {
    AppState newAppState =
        new AppState(prev.counter, action.quote, action.author);

    return newAppState;
  } else {
    return prev;
  }
}
