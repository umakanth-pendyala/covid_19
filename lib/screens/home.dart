import 'package:flutter/material.dart';
import 'package:covid19/constants.dart';
import 'package:covid19/screens/load_screen.dart';
import 'package:covid19/screens/precaution_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff473f97),
          title: Text('welcome'),
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff473f97),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 35, 20, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Covid - 19',
                          style: KMainTitle,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Are you feeling sick ?',
                          style: KSubTitle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'if you feel sick with any of the covid 19 symptoms please call or SMS govt immediately',
                          style: KHeaderTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                onPressed: () {
//                                print('clicked');
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return PrecautionScreen();
                                  }));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                color: Color(0xffff4c58),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                      'PRECAUTIONS',
                                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return LoadScreen(loadData: true);
                                  }));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                ),
                                color: Color(0xff4c79ff),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                      'CASES',
                                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Prevention',
                        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: <Widget>[
                                 CircleAvatar(
                                   backgroundImage: AssetImage('images/img_1.jpg'),
                                   radius: 50.0,
                                 ),
                                  Text('Avoid close \ncontact', textAlign: TextAlign.center,),
                               ],
                             ),
                           ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/hands_clean.png'),
                                    radius: 50.0,
                                  ),
                                  Text('wash your \nhands often', textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/face_mask.jpeg'),
                                    radius: 50.0,
                                  ),
                                  Text('Wear a \nface mask', textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
//                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [const Color(0xFFAB9EE3), const Color(0xFF575597)],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                            child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Image(
                                    image: AssetImage('images/medic.png'),
                                    height: 100.0,
                                    width: 100.0,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Do your own test',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'follow google instructions to do your own test',
                                        style: TextStyle(color: Colors.white, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
