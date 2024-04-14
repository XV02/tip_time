import 'package:flutter/material.dart';

class TipTimeProvider with ChangeNotifier {
  var _costController = TextEditingController();
  TextEditingController get costController => _costController;

  bool _isRoundedRequested = false; // para redondear propina
  bool get isRoundedRequested => _isRoundedRequested;

  int? _currentRadio; // indica el radio marcado como seleccionado
  int? get currentRadio => _currentRadio;

  double _tipAmount = 0.0; // cantidad de propina a dejar
  double get tipAmount => _tipAmount;

  var _radioGroupValues = {
    // contenido en texto de los radios
    0: "Amazing 20%",
    1: "Good 18%",
    2: "Ok 15%",
  };
  // Getters para el contenido de los radios
  Map<int, String> get radioGroupValues => _radioGroupValues;

  var _radioGroupAssets = {
    0: "assets/icons/like_high.png",
    1: "assets/icons/like_mid.png",
    2: "assets/icons/like_low.png",
  };
  // Getters para el contenido de los radios
  Map<int, String> get radioGroupAssets => _radioGroupAssets;

  void setIsRoundedSelected(bool updatedSwitchValue) {
    _isRoundedRequested = updatedSwitchValue;
    notifyListeners();
  }

  void setSelectedRadio(int? updatedRadioValue) {
    _currentRadio = updatedRadioValue;
    notifyListeners();
  }

  void tipCalculation(double dato) {
    if (_currentRadio == null) {
      return;
    }
    var tipPercentage = 0.0;
    switch (_currentRadio) {
      case 0:
        tipPercentage = 0.20;
        break;
      case 1:
        tipPercentage = 0.18;
        break;
      case 2:
        tipPercentage = 0.15;
        break;
    }
    var tip = dato * tipPercentage;
    if (_isRoundedRequested) {
      tip = tip.ceilToDouble();
    }
    _tipAmount = tip;
    notifyListeners();
  }
}
