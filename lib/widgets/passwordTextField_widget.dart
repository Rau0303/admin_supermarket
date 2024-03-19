import 'package:flutter/material.dart';
class PasswordTextField_widget extends StatefulWidget {
  const PasswordTextField_widget({
    super.key,
    required this.passwordController,
    required this.hintText,
  }) ;

  final TextEditingController passwordController;
  final String hintText;

  @override
  State<PasswordTextField_widget> createState() => _PasswordTextField_widgetState();
}

class _PasswordTextField_widgetState extends State<PasswordTextField_widget> {
  bool isHiddenPassword = true;

  void togglePass(){
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

          ),
          suffix: InkWell(
            onTap: togglePass,
            child: Icon(
              isHiddenPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Colors.black,
            ),
          )
      ),
    );
  }
}
