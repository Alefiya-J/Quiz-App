import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizpicableme/quizpage.dart';
import 'package:quizpicableme/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);
        print(SizeConfig.heightMultiplier);
        print(SizeConfig.widthMultiplier);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QuizpicableMe',
          home: Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  void navigate(category, title, context, imgurl, color) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuizPage(
            category: category, title: title, imgurl: imgurl, color: color)));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 3.22 * SizeConfig.heightMultiplier),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'QUIZPICABLE\nME!',
                  style: TextStyle(
                      fontSize: 5.5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontFamily: 'Margarine',
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 1.1 * SizeConfig.heightMultiplier),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('gk', 'General Knowledge', context,
                        'assets/gk.jpg', Colors.red[300]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.red[300],
                    shadowColor: Colors.red[900],
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                          child: Text('G.K.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 3.64 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Acme')),
                        )),
                        Expanded(
                          child: Image.asset(
                            'assets/gk_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('sport', 'Sports', context, 'assets/sport.jpg',
                        Colors.cyan);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.cyan,
                    shadowColor: Colors.cyan,
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('Sports',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/sports_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('entertainment', 'Entertainment', context,
                        'assets/entertainment.jpg', Colors.teal[300]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.teal[300],
                    shadowColor: Colors.teal,
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text('Entertainment',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            'assets/entertainment_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 30.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('tech', 'Technology', context, 'assets/tech.jpeg',
                        Colors.blue[400]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.blue[400],
                    shadowColor: Colors.blue,
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('Technology',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/tech_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('friends', 'F.R.I.E.N.D.S', context,
                        'assets/friends.jpg', Colors.deepOrange[200]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.deepOrange[200],
                    shadowColor: Colors.deepOrange[300],
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('F.R.I.E.N.D.S',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/friends_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('astronomy', 'Astronomy', context,
                        'assets/astronomy.jpg', Colors.amber[200]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.amber[300],
                    shadowColor: Colors.amber,
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('Astronomy',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/astronomy_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('socialmedia', 'Social Media', context,
                        'assets/socialmedia.jpg', Colors.indigoAccent[100]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.indigoAccent[100],
                    shadowColor: Colors.indigo,
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('Social Media',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/socialmedia_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    navigate('mcu', 'Marvel Cinematic Universe', context,
                        'assets/mcu.png', Colors.purple[200]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.purple[200],
                    shadowColor: Colors.purple,
                    elevation: 8,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('M.C.U',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 3.64 * SizeConfig.textMultiplier,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Acme')),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/mcu_tile.png',
                            height: 17.2 * SizeConfig.heightMultiplier,
                            width: 36.4 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.76 * SizeConfig.heightMultiplier),
          ],
        ),
      ),
    );
  }
}
