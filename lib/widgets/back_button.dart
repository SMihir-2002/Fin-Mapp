
import 'package:fin_mapp/constants/text_styles.dart';
import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  const backButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 40),
        child:  Row(
          children: [
            const Icon(Icons.arrow_back),
            Text(
              "  Back",
              style: AppTexts.font1,
            ),
          ],
        ));
  }
}
