import 'package:flutter/material.dart';

class IconHeaderSubHeader extends StatelessWidget {
  final IconData icon;
  final String header;
  final String subheader;

  const IconHeaderSubHeader({super.key,
    required this.icon,
    required this.header,
    required this.subheader,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(icon, size: 30.0),
        ), // Icon on the left
        const SizedBox(width: 8.0), // Space between the icon and the text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                subheader,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white.withOpacity(0.8),
                ),
              ), // Subheader text
            ],
          ),
        ),
      ],
    );
  }
}
