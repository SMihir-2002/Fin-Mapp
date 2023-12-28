import 'package:fin_mapp/data.dart';
import 'package:flutter/material.dart';

class SingleSelectWidget extends StatefulWidget {
  const SingleSelectWidget(
      {super.key,
      required this.singleSelectSchema,
      });
  final Map singleSelectSchema;
  

  @override
  State<SingleSelectWidget> createState() => _SingleSelectWidgetState();
}

class _SingleSelectWidgetState extends State<SingleSelectWidget> {




@override
  void initState() {
    
    answeredData[widget.singleSelectSchema["name"]] = null;
    super.initState();
  }

  String groupVal = "";





  radioList() {
    return List.generate(
        widget.singleSelectSchema["options"].length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: RadioListTile(
              activeColor: Colors.green,
              contentPadding: const EdgeInsets.all(0.0),
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.green),
              ),
              title: Text(widget.singleSelectSchema["options"][index]["value"]),
              value: widget.singleSelectSchema["options"][index]["value"],
              groupValue: groupVal,
              onChanged: (val) {
                setState(() {
                  groupVal = val;
                  answeredData[widget.singleSelectSchema["name"]] = val;
                });
              }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.singleSelectSchema["label"],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ...radioList()
        ],
      ),
    );
  }
}
