import 'package:flutter/material.dart';

class StepProgressIndicator extends StatelessWidget {
  const StepProgressIndicator(
      {super.key, required this.divisons, required this.coveredSteps});
  final int divisons;
  final int coveredSteps;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.94,
      height: 3,
      child: ListView.builder(
        itemCount: divisons,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin:const EdgeInsets.only(right: 3),
          width: size.width / divisons,
          height: index <= coveredSteps ? 3 : 2,
          decoration: BoxDecoration(
            color: index <= coveredSteps ?Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(2)),
        ),
      ),
    );
  }
}
