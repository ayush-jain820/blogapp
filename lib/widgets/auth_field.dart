import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String text;
  // ignore: non_constant_identifier_names
  final TextEditingController? Controller;
  final bool isobscure;
  final Icon? icon;

  const AuthField({
    super.key,
    required this.text,
    // ignore: non_constant_identifier_names
    required this.Controller,
    this.isobscure = false,
    this.icon,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isobscure;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.text,
        icon: widget.icon,
        suffixIcon: widget.isobscure
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${widget.text}';
        }
        return null;
      },
      controller: widget.Controller,
      obscureText: _obscureText,
    );
  }
}
