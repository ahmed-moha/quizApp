import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> questions = [
  //   'Flutter is best framework in mobile application development',
  //   'Ahmed is not flutter certfied mobile application developer',
  //   ' flutter was released in 2017',
  // ];
  // List<bool> answers = [true, false, true];

  List<Question> questions = [
    Question(
        q: 'Flutter is best framework in mobile application development',
        a: true),
    Question(q: 'in flutter samicolon is is not must', a: false),
    Question(q: 'flutter was released in 2017', a: true),
  ];

  int questionIndex = 0;
  int correctAnswers = 0;
  int falseAnswers = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081c15),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                questions[questionIndex].questionName!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 22, letterSpacing: 2.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22),
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        final isCorrect =
                            questions[questionIndex].questionAnswer;

                        if (isCorrect == true) {
                          print('WAA SAX');
                          setState(() {
                            correctAnswers = correctAnswers + 1;
                          });
                        } else {
                          print('WAA QALADAY');
                          setState(() {
                            falseAnswers = falseAnswers + 1;
                          });
                        }
                        setState(() {
                          if (questionIndex < questions.length - 1)
                            questionIndex++;
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Result(
                                    answer: correctAnswers,
                                    falses: falseAnswers),
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        'True',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        final isFalse = questions[questionIndex].questionAnswer;

                        if (isFalse == false) {
                          print('WAA SAXDAY');
                          setState(() {
                            correctAnswers = correctAnswers + 1;
                          });
                        } else {
                          print('WAA QALDAY');
                          setState(() {
                            falseAnswers = falseAnswers + 1;
                          });
                        }
                        setState(() {
                          if (questionIndex < questions.length - 1)
                            questionIndex++;
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Result(
                                    answer: correctAnswers,
                                    falses: falseAnswers,
                                  );
                                },
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        'False',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


/* 
   Flutter is best framework in mobile application development  , true

   Ahmed is not flutter certfied mobile application developer, false,

   flutter was released in 2017 , true
    

   */