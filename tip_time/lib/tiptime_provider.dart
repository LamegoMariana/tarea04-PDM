import 'package:flutter/material.dart';

class TiptimeProvider extends ChangeNotifier {
  var _costControl = TextEditingController();
  var propinaControl = TextEditingController();
  var redondeoControl = TextEditingController();

  int? _currentSelectedRadio;

  var radioGroup = {0: "Amazing 20%", 1: "Good 18%", 2: "Okay 15%"};

  bool _switch = false;
  double _tip = 0.0;

  bool get currentSelectedSwitch => _switch;
  double get getTip => _tip;
  TextEditingController get getCost => _costControl;

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (entry) => ListTile(
            trailing: Radio(
              value: entry.key,
              groupValue: _currentSelectedRadio,
              onChanged: (newValue) {
                _currentSelectedRadio = newValue;
                notifyListeners();
              },
            ),
            title: Text("${entry.value}"),
          ),
        )
        .toList();
  }

  void changeSwitch(val) {
    _switch = val;
    notifyListeners();
  }

  void calculateTip(int currentSelectedRadio) {
    if (_switch == true) {
      _tip +=
          (int.parse(_costControl.text) * (currentSelectedRadio / 100)).ceil();
    } else {
      _tip += int.parse(_costControl.text) * (currentSelectedRadio / 100);
    }
    notifyListeners();
  }
}
