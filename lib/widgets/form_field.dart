import 'package:flutter/material.dart';

class Form_FieldNumber extends StatelessWidget {

  String hint, helper, label;
  Function onValidade, onSave;
  TextEditingController controller = TextEditingController();
  Form_FieldNumber({this.hint, this.helper, this.label, this.onValidade, this.onSave, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          helperText: helper,
          labelText: label,
          contentPadding: const EdgeInsets.only(right: 15)
        ),
        controller: controller,
        validator: onValidade,
        onSaved: onSave,
        keyboardType: TextInputType.number,
    );
  }
}
