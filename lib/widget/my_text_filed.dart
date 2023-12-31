import 'package:flutter/material.dart';

class MyTextFiled extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  const MyTextFiled(
    {super.key, this.hint, this.label, this.controller}
  );

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Champ vide !';
        }
        return null;
      },
    );
  }
}
