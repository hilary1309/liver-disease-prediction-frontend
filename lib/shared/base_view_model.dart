import 'package:flutter/widgets.dart';
import 'package:ldp_prediction/constant/view_state.dart';
//import 'package:ldp_prediction/shared/validator.dart';
 


/// Class for view models to extend from. Keeps track
/// of [ViewState] and exposes a function to change the
/// state of the view.
class BaseNotifier extends ChangeNotifier   {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  String _currentError = "Unknown Error";
  String get error => _currentError;

  bool _disposed = false;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setError(String e) {
    _currentError = e;
    _state = ViewState.Error;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_disposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
