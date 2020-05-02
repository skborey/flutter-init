// AppState
class AppState {
  int _counter;
  String _quote;
  String _author;

  int get counter => _counter;
  String get quote => _quote;
  String get author => _author;

  AppState(this._counter, this._quote, this._author);
}

class UpdateQuoteAction {
  String _quote;
  String _author;

  String get quote => this._quote;
  String get author => this._author;

  UpdateQuoteAction(this._quote, this._author);
}
