import 'package:fin_mapp/data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultView extends StatelessWidget {
  ResultView({super.key});
  List dataSelected = answeredData.keys.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(dataSelected.length, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("${index+1}.    ${dataSelected[index]}"),
                Text("->  ${answeredData[dataSelected[index]]}"),
                const SizedBox(height: 30,),
              ],
            );
          })),
        ),
      ),
    );
  }
}
