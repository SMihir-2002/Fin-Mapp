
import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  const backButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40),
        child: const Row(
          children: [
            Icon(Icons.arrow_back),
            Text(
              "  Back",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ],
        ));
  }
}
