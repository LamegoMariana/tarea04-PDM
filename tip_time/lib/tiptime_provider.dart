import 'package:flutter/material.dart';

class TiptimeProvider extends ChangeNotifier {
  var costoControl = TextEditingController();
  var propinaControl = TextEditingController();
  var redondeoControl = TextEditingController();

  int? currentSelectedRadio;
  bool currentSelectedSwitch = false;

  var radioGroup = {0: "Amazing 20%", 1: "Good 18%", 2: "Okay 15%"};

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (entry) => ListTile(
            trailing: Radio(
              value: entry.key,
              groupValue: currentSelectedRadio,
              onChanged: (newValue) {
                currentSelectedRadio = newValue;
                notifyListeners();
              },
            ),
            title: Text("${entry.value}"),
          ),
        )
        .toList();
  }

  void changeSwitch(String currentSelectedSwitch) {
    currentSelectedSwitch =
        (currentSelectedSwitch == "verdadero") ? "falso" : "verdadero";
  }
}
