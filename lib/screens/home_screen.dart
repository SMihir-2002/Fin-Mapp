import 'package:fin_mapp/constants/text_styles.dart';
import 'package:fin_mapp/data.dart';
import 'package:fin_mapp/screens/result_screen.dart';
import 'package:fin_mapp/widgets/back_button.dart';
import 'package:fin_mapp/widgets/dialog_widget.dart';
import 'package:fin_mapp/widgets/label.dart';
import 'package:fin_mapp/widgets/numeric_text_field.dart';
import 'package:fin_mapp/widgets/single_select.dart';
import 'package:fin_mapp/widgets/step_progress_indicator.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List sectionSchema = questionData["schema"]["fields"];
  static int answeredQuestions = 0;

  renderView({
    required Map objectData,
  }) {
    switch (objectData['type']) {
      case 'SingleChoiceSelector':
      case 'SingleSelect':
        return SingleSelectWidget(
          singleSelectSchema: objectData["schema"],
        );
      case 'Label':
        return Label(data: objectData["schema"]["name"]);
      case 'Numeric':
        return NumericTextField(
          textFieldSchema: objectData["schema"],
        );
      case 'Section':
        return Column(
            children:
                List.generate(objectData["schema"]["fields"].length, (ind) {
          return renderView(
            objectData: objectData["schema"]["fields"][ind],
          );
        }));

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const SizedBox(height: 20,),
            Text(questionData["title"], style:  AppTexts.titleText),
            const SizedBox(
              height: 20,
            ),
            StepProgressIndicator(
                divisons: sectionSchema.length, coveredSteps: answeredQuestions),
            renderView(
              objectData: sectionSchema[answeredQuestions],
            ),
            answeredQuestions == sectionSchema.length - 1
                ? ElevatedButton(
                  
                    onPressed: () {
                      if (answeredData.values.any((value) => value == null)) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const DialogueWidget();
                            });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ResultView()),
                        );
                      }
                    },
                    child: const Text("Submit"))
                : const SizedBox()
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          answeredQuestions > 0
              ? InkWell(
                  onTap: () {
                    setState(() {
                     if ((answeredData["typeOFLoan"] !=
                                  "Balance transfer & Top-up" ||
                              answeredData["typeOFLoan"] == null) &&
                          answeredQuestions == 4) {
                        answeredQuestions = answeredQuestions -2 ;
                      } else {
                        answeredQuestions--;
                      }
                    });
                  },
                  child: const backButton(),
                )
              : const SizedBox(),
          answeredQuestions < sectionSchema.length - 1
              ? FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: const Color(0xFFf7700F),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if ((answeredData["typeOFLoan"] !=
                                  "Balance transfer & Top-up" ||
                              answeredData["typeOFLoan"] == null) &&
                          answeredQuestions == 2) {
                        answeredQuestions = answeredQuestions + 2;
                      } else {
                        answeredQuestions++;
                      }
                    });
                  })
              : const SizedBox(),
        ],
      ),
    );
  }
}
