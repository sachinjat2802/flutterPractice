import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';
import 'result.dart';
import 'calculation.dart';

Color maleCardColor = deActivecardColor;
Color femaleCardColor = deActivecardColor;
enum Cards { maleCardColor, femaleCardColor, color }
int num = 180;
int weight = 60;
int age = 18;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Cards selectedCard = Cards.color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RuCard(
                    selectedCard == Cards.maleCardColor
                        ? mainButtonColor
                        : deActivecardColor,
                    const CardChild(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    () {
                      setState(
                        () {
                          selectedCard = Cards.maleCardColor;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: RuCard(
                    selectedCard == Cards.femaleCardColor
                        ? mainButtonColor
                        : deActivecardColor,
                    const CardChild(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    () {
                      setState(
                        () {
                          selectedCard = Cards.femaleCardColor;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RuCard(
                deActivecardColor,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '$num cm',
                        style: const TextStyle(
                            fontSize: 70, fontWeight: FontWeight.w900),
                      ),
                      Slider(
                        value: num.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            num = newValue.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
                () {}),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RuCard(
                      deActivecardColor,
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              "WEIGHT",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '$weight kg',
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RoundButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      () {}),
                ),
                Expanded(
                  child: RuCard(
                      deActivecardColor,
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '$age yr',
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RoundButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      () {}),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calc calc = Calc(height: num, weight: weight);
              String bmi = calc.bmiCalc();
              String result = calc.getResult();
              String inter = calc.getInterption();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Result(bmi: bmi, result: result, interption: inter),
                ),
              );
            },
            child: Container(
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              color: mainButtonColor,
              width: double.infinity,
              height: mainButtonHeight,
            ),
          )
        ],
      ),
    );
  }
}

class CardChild extends StatelessWidget {
  final String text;

  final IconData icon;

  const CardChild({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 120,
          ),
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class RuCard extends StatelessWidget {
  RuCard(this.colour, this.cardChild, this.onPress);
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);
  final IconData icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: deActivecardColor,
      child: Icon(icon),
    );
  }
}
