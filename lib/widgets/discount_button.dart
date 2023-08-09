import 'package:alphaai/constants/theme_data.dart';
import 'package:flutter/material.dart';

class DiscountButton extends StatefulWidget {
  final String header;
  final String subHeader;
  final bool showDiscount;
  final bool isSelected;
  final VoidCallback onPressed;

  const DiscountButton({super.key,
    required this.header,
    required this.subHeader,
    this.showDiscount = false,
    this.isSelected = false,
    required this.onPressed,
  });

  @override
  State<DiscountButton> createState() => _DiscountButtonState();
}

class _DiscountButtonState extends State<DiscountButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: widget.isSelected?Colors.blueAccent.withOpacity(0.8):Colors.transparent,
          border: Border.all(
            color: Colors.blueAccent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subHeader,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    widget.header,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.showDiscount)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8.0),
                
                child: const Text(
                  "Save 70%",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
