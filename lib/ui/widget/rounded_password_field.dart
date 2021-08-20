import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/ui/widget/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final String? hintText;
  final IconData icon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const RoundedPasswordField({
    Key? key,
    this.hintText,
    this.icon = Icons.lock,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _hidePassword = true;

  @override
  void initState() {
    _hidePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: TextStyle(color: Colors.black54),
        obscureText: _hidePassword,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black54),
          icon: Icon(widget.icon, color: Colors.black54),
          suffixIcon: InkWell(
            child: Icon(
              Icons.visibility,
              color: Colors.black54,
            ),
            onTap: _togglePasswordView,
          ),
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
      ),
    );
  }

  _togglePasswordView() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }
}
