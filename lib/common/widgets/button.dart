import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final bool isLoading;
  final bool isDisabled;
  final double? height;

  const Button({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.height = 54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: isDisabled
              ? null
              : () {
                  if (!isLoading) {
                    onPressed();
                  }
                },
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  buttonText,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
        ),
      ),
    );
  }
}
