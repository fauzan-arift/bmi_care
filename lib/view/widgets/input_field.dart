import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? errorText;
  final Function(String) onChanged;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: const Color(0xFF0074D9),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Material(
          elevation: 4,
          shadowColor: Colors.black54,
          borderRadius: BorderRadius.circular(10),
          child: TextField(
            cursorColor: const Color(0xFF0074D9),
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.blueGrey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0EDED),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey[400],
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              errorText: errorText,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
