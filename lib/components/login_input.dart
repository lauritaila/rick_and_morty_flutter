import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool visibility;
  final int validator;
  const LoginInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.visibility,
      required this.validator});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.visibility,
      validator: (value) {
        switch (widget.validator) {
          case 1:
            if (value == null || value.isEmpty) {
              return '✖️  Por favor ingresa un usuario válido';
            }
            break;
          case 2:
            if (value == null || value.isEmpty || value.length < 6) {
              return '✖️  Por favor ingresa una contraseña válida';
            }
            break;
        }
        return null;
      },
      controller: widget.controller,
      style: const TextStyle(fontSize: 14, color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(36, 34, 53, 1),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide:
              BorderSide(color: Color.fromRGBO(36, 34, 53, 1), width: 2),
        ),
        focusedBorder: const GradientOutlineInputBorder(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 245, 160, 1),
              Color.fromRGBO(0, 217, 245, 1)
            ]),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            width: 2),
      ),
    );
  }
}
