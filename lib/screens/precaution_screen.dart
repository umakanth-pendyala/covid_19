import 'package:flutter/material.dart';

class PrecautionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('THESE ARE THE PRECAUTIONS YOU NEED TO FOLLOW')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0),
              child: Text('1. wash your hands every 20 minutes', style: TextStyle(fontSize: 20.0),),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Text('2. Eat healthy food every day', style: TextStyle(fontSize: 20.0),),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Text('3. Do some excercise', style: TextStyle(fontSize: 20.0),),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Text('4. Quit tobacco', style: TextStyle(fontSize: 20.0),),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Text('5. Use cleaners and disinfectants', style: TextStyle(fontSize: 20.0),),
            ),
          ],
        ),
      ),
    );
  }
}
