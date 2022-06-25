import 'package:emergency_care_app/constan/penanganan_p3k_data.dart';
import 'package:emergency_care_app/constan/request_state.dart';
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  RequestState _state = RequestState.Initial;
  RequestState get state => _state;

  Future<void> fetchHome() async {
    _state = RequestState.Loading;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));
    _state = RequestState.Loaded;
    notifyListeners();
  }
}
