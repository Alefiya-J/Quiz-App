import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:ui' as ui;

import 'package:quizpicableme/size_config.dart';

class End extends StatefulWidget {
  final int score;
  final Color color;
  final String name;
  End(this.name, this.score, this.color);

  @override
  _EndState createState() => _EndState();
}

class _EndState extends State<End> {
  GlobalKey containerKey = GlobalKey();
  bool isVisible = true;

  void share() async {
    // setState(() {
    //   isVisible = false;
    // });
    RenderRepaintBoundary renderRepaintBoundary =
        containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    Share.file('Share via', 'MyScore.png', uint8list, 'image/png');
    // setState(() {
    //   isVisible = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          RepaintBoundary(
            key: containerKey,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.2 * SizeConfig.heightMultiplier),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'Congratulations!',
                          style: TextStyle(
                              fontSize: 6.16 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontFamily: 'Acme',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'You have completed your ${widget.name} quiz',
                          style: TextStyle(
                              fontSize: 5.2 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontFamily: 'Acme',
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CircularPercentIndicator(
                        radius: 26.49 * SizeConfig.heightMultiplier,
                        lineWidth: 20.0,
                        animationDuration: 1000,
                        progressColor:
                            Color.alphaBlend(Colors.black26, widget.color),
                        animation: true,
                        percent: widget.score / 10,
                        center: new Icon(Icons.check,
                            color:
                                Color.alphaBlend(Colors.black26, widget.color),
                            size: 18.5 * SizeConfig.heightMultiplier),
                        circularStrokeCap: CircularStrokeCap.round,
                        footer: Text(
                          "Your score is ${widget.score} /10. ",
                          style: new TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 4.2 * SizeConfig.textMultiplier,
                              fontFamily: 'Acme',
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Center(
                    //     child: Text(
                    //       "Your score is ${widget.score} /10. ",
                    //       style: new TextStyle(
                    //           fontWeight: FontWeight.w800,
                    //           fontSize: 34.0,
                    //           fontFamily: 'Acme',
                    //           color: Colors.black),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 10.28 * SizeConfig.heightMultiplier),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5.5 * SizeConfig.heightMultiplier,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  share();
                },
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Text(
                  'Share',
                  style: TextStyle(fontSize: 2.4 * SizeConfig.textMultiplier),
                ),
                color: Color.alphaBlend(Colors.black26, widget.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*class Confetti extends StatefulWidget {
  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  ConfettiController hurray1;
  ConfettiController hurray2;

  @override
  void initState() {
    hurray1 = ConfettiController(duration: Duration(seconds: 5));
    hurray2 = ConfettiController(duration: Duration(seconds: 5));

    super.initState();
    hurray1.play();
    hurray2.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: ConfettiWidget(
            confettiController: hurray1,
            maxBlastForce: 20,
            minBlastForce: 10,
            numberOfParticles: 10,
            gravity: 0.3,
            emissionFrequency: 0.05,
            blastDirection: -5 * pi / 12,
            colors: const [Colors.yellow, Colors.blue],
            shouldLoop: true,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ConfettiWidget(
            confettiController: hurray2,
            maxBlastForce: 20,
            minBlastForce: 10,
            numberOfParticles: 10,
            gravity: 0.3,
            emissionFrequency: 0.05,
            blastDirection: -7 * pi / 12,
            colors: const [
              Colors.yellow,
              Colors.blue,
            ],
            shouldLoop: true,
          ),
        ),
      ],
    );
  }
}*/
