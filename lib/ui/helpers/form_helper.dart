import 'package:flutter/widgets.dart';

class FormHelper {
  Map<String, TextEditingController> _fields = {};

  Map<String, TextEditingController> get fields => _fields;

  FormHelper(Set<String> keys) {
    keys.forEach((key) {
      _fields[key] = TextEditingController();
    });
  }

  void resetForm() {
    _fields.forEach((key, value) {
      value.clear();
    });
  }

  Map<String, dynamic> getJson() {
    Map<String, dynamic> json = {};
    _fields.forEach((key, value) {
      json[key] = _fields[key]!.text;
    });

    return json;
  }
}
