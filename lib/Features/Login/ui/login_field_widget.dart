import 'package:flutter/material.dart';

class LoginFieldWidget extends StatelessWidget {
  const LoginFieldWidget({
    super.key,
    required this.text,
    required this.controller,
    this.obsSecureText,
    this.password,  this.textInputAction, required this.prefixIcon,
  });
  final String text;
  final TextEditingController controller;
  final bool? obsSecureText;
  final bool? password;
  final TextInputAction? textInputAction;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.green),
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 220, 239, 239),
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          enabled: true,
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
              borderRadius: BorderRadius.circular(30)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(30)),
          labelText: text.toString(),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          prefixIcon:  prefixIcon,
          suffixIcon: password == null
              ? null
              : obsSecureText == true
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off,
                        size: 20,
                        color: Colors.green,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: Colors.green,
                      ),
                    ),
        ),
        validator: (value) {
          // RegExp regexp = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return 'Please enter $text';
          }
          return null;
        },
      ),
    );
  }
}
