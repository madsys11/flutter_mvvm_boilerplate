import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/ui/widget/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final bool autofocus;
  final IconData icon;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const RoundedInputField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.autofocus = false,
    this.icon = Icons.person,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autofocus: autofocus,
        style: TextStyle(color: Colors.black54),
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          icon: Icon(icon, color: Colors.black54),
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
        ),
        validator: validator,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
