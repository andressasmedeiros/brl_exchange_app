import 'package:flutter/material.dart';

class CurrencyInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmit;

  const CurrencyInput({super.key, required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Enter the currency code",
            hintStyle: const TextStyle(color: Colors.blue),
            floatingLabelStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            filled: true,
            fillColor: Colors.grey[100],
            border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
          textCapitalization: TextCapitalization.characters,
          onSubmitted: (value) => onSubmit(value),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00B4FF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () => onSubmit(controller.text),
          child: const Text("EXCHANGE RESULT"),
        ),
      ],
    );
  }
}
