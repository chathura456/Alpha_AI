import 'package:alphaai/constants/theme_data.dart';
import 'package:flutter/material.dart';

class SuggestionTypeButton extends StatefulWidget {
  const SuggestionTypeButton({
    super.key,
    required this.emoji,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  });

  final String emoji;
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  State<SuggestionTypeButton> createState() => _SuggestionTypeButtonState();
}

class _SuggestionTypeButtonState extends State<SuggestionTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: widget.isSelected ? Colors.blueAccent.withOpacity(0.3) : AppColors.containerColor, // Change color if selected
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: widget.isSelected ? Colors.blueAccent : Colors.transparent), // Border color
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        icon: Text(
          widget.emoji,
          style: TextStyle(fontSize: 18.0),
        ),
        label: Text(
          widget.label,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

