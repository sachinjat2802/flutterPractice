import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quesList.dart';

void main() => runApp(const Quiz());

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(child: QuizPage()),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score = [];

  QuesList quesList = QuesList();

  void checkAns(a) {
    setState(() {
      if (quesList.isFinish() == true) {
        Alert(
          context: context,
          title: "finished",
          desc: "you have reached at end of quiz",
        ).show();
        quesList.reset();
        score = [];
      }
      if (quesList.getAns() == a) {
        score.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        quesList.nextQues();
      } else {
        score.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        quesList.nextQues();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quesList.getQues(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                checkAns('true');
              },
              child: const Text(
                "True",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                checkAns('false');
              },
              child: const Text(
                "False",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}
