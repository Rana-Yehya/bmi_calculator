import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget buttonChild;
  final VoidCallback onTap;
  final bool enabled;
  final Color? buttonColor;
  const CustomButton(
      {super.key,
      required this.buttonChild,
      required this.onTap,
      this.buttonColor,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttonColor ?? Color(0xFF2566CF),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: buttonChild,
      ),
      //),
    );
  }
}
