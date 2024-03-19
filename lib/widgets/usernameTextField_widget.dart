import 'package:flutter/material.dart';
class UsernameTextField_widget extends StatelessWidget {
  const UsernameTextField_widget({
    super.key,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          )
      ),
    );
  }
}