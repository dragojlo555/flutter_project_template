import 'package:flutter/material.dart';

class ProgressIndicatorDialog extends StatelessWidget {
  const ProgressIndicatorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading")),
        ],
      ),
    );
  }
}
