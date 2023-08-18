import 'package:flutter/material.dart';

TextFormField buildFormField(

    {required TextEditingController textEditingController,
      required String label,
    required FormFieldValidator formFieldValidator,
    required Icon preIcon,
    required Icon sufIcon,
    required TextInputType textInputType}) {
  return TextFormField(controller:textEditingController ,
    validator: formFieldValidator,
    keyboardType: textInputType,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      suffixIcon: sufIcon,
      label: Text(label),
      prefixIcon: preIcon,
    ),
  );
}
