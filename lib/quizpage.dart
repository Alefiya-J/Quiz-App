import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizpicableme/questionlist.dart';
import 'dart:async';
import 'package:quizpicableme/questions.dart';
import 'package:quizpicableme/size_config.dart';
import 'end.dart';

class QuizPage extends StatefulWidget {
  final String category;
  final String title;
  final String imgurl;
  final Color color;

  const QuizPage({Key key, this.category, this.title, this.imgurl, this.color})
      : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int number = 0;
  int score = 0;
  List<bool> _correct = [];
  Timer _timer;
  int counter = 30;
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    _questions = genre[widget.category]['questions'];
    _questions.shuffle();
    initTimer();
  }

  void initTimer() {
    if (_timer != null) {
      counter = 30;
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        _timer.cancel();
        _correct.add(false);
        quesno(context, _questions, widget.color);
      }
    });
  }

  void quesno(context, _questions, color) {
    if (number < _questions.length - 1) {
      setState(() {
        number++;
        initTimer();
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => End(widget.title, score, color)));
    }
  }

  Future<bool> back(context) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Exit Quiz'),
                content: Text('Do you want to exit this quiz?'),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('YES')),
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('NO')),
                ],
              );
            }) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => back(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 3.1 * SizeConfig.textMultiplier,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          titleSpacing: 1,
          backgroundColor: widget.color,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.imgurl), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 9.6 * SizeConfig.heightMultiplier,
                child: CircularPercentIndicator(
                  radius: 6.91 * SizeConfig.heightMultiplier,
                  lineWidth: 10.0,
                  animationDuration: 0,
                  progressColor: widget.color,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
                  animation: true,
                  percent: 1 - counter / 30,
                  center: Container(
                    width: 10.22 * SizeConfig.widthMultiplier,
                    height: 4.84 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$counter',
                      style: TextStyle(
                          color: widget.color,
                          fontSize: 2.4 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    shadowColor: Color.fromRGBO(0, 0, 0, 0.8),
                    elevation: 8,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _questions[number].que,
                          style: TextStyle(
                              color: widget.color,
                              fontSize: 3.5 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.1 * SizeConfig.heightMultiplier),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      onPressed: () {
                        String correct = _questions[number].answer;
                        if (_questions[number].op1 == correct) {
                          setState(() {
                            score++;
                          });
                        }
                        setState(() {
                          _correct.add(_questions[number].op1 == correct);
                        });
                        quesno(context, _questions, widget.color);
                      },
                      child: Text(
                        _questions[number].op1,
                        style: TextStyle(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.3 * SizeConfig.textMultiplier),
                        textAlign: TextAlign.center,
                      ),
                      color: Color.fromRGBO(51, 51, 51, 0.9)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      onPressed: () {
                        String correct = _questions[number].answer;
                        if (_questions[number].op2 == correct) {
                          setState(() {
                            score++;
                          });
                        }
                        setState(() {
                          _correct.add(_questions[number].op2 == correct);
                        });
                        quesno(context, _questions, widget.color);
                      },
                      child: Text(
                        _questions[number].op2,
                        style: TextStyle(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.3 * SizeConfig.textMultiplier),
                        textAlign: TextAlign.center,
                      ),
                      color: Color.fromRGBO(51, 51, 51, 0.9)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      onPressed: () {
                        String correct = _questions[number].answer;
                        if (_questions[number].op3 == correct) {
                          setState(() {
                            score++;
                          });
                        }
                        setState(() {
                          _correct.add(_questions[number].op3 == correct);
                        });
                        quesno(context, _questions, widget.color);
                      },
                      child: Text(
                        _questions[number].op3,
                        style: TextStyle(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.3 * SizeConfig.textMultiplier),
                        textAlign: TextAlign.center,
                      ),
                      color: Color.fromRGBO(51, 51, 51, 0.9)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      onPressed: () {
                        String correct = _questions[number].answer;
                        if (_questions[number].op4 == correct) {
                          setState(() {
                            score++;
                          });
                        }
                        setState(() {
                          _correct.add(_questions[number].op4 == correct);
                        });
                        quesno(context, _questions, widget.color);
                      },
                      child: Text(
                        _questions[number].op4,
                        style: TextStyle(
                            color: widget.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 2.4 * SizeConfig.textMultiplier),
                        textAlign: TextAlign.center,
                      ),
                      color: Color.fromRGBO(51, 51, 51, 0.9)),
                ),
              ),
              SizedBox(height: 0.4 * SizeConfig.heightMultiplier),
              Container(
                height: 8.5 * SizeConfig.heightMultiplier,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold,
                          color: widget.color,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        border: _correct.length > index
                            ? Border.all(
                                width: 0.6 * SizeConfig.widthMultiplier,
                                color:
                                    _correct[index] ? Colors.green : Colors.red)
                            : null,
                      ),
                      width: 9.12 * SizeConfig.widthMultiplier,
                      height: 5.12 * SizeConfig.heightMultiplier,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 0.85 * SizeConfig.widthMultiplier);
                  },
                ),
              ),
              SizedBox(height: 0.1 * SizeConfig.heightMultiplier),
            ],
          ),
        ),
      ),
    );
  }
}
