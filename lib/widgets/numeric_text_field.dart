import 'package:fin_mapp/data.dart';
import 'package:flutter/material.dart';

class NumericTextField extends StatelessWidget {
  const NumericTextField({super.key, required this.textFieldSchema});
  final Map textFieldSchema;
  @override
  Widget build(BuildContext context) {
    answeredData[textFieldSchema["name"]] = null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18),
      child: Column(
        children: [
          Text(textFieldSchema["label"]),
          TextField(
            onChanged: (val) {
              answeredData[textFieldSchema["name"]] = val;
             
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.currency_rupee, color: Colors.green),
              labelText: 'Amount',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
