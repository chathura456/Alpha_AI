import 'package:alphaai/pages/chatbot_page.dart';
import 'package:flutter/material.dart';

import '../constants/theme_data.dart';

class SuggestionContent extends StatefulWidget {
  const SuggestionContent({
    super.key,
    required this.label,
    required this.prompt,
    required this.categoryName,
  });
  final String label;
  final String prompt;
  final String categoryName;

  @override
  State<SuggestionContent> createState() => _SuggestionContentState();
}

class _SuggestionContentState extends State<SuggestionContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatbotPage(
              categoryName: widget.categoryName,
              label: widget.label,
              prompt: widget.prompt,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        margin: const EdgeInsets.only(bottom: 15.0, left: 10, right: 10),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
