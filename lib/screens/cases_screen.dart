import 'package:flutter/material.dart';
//import 'package:lite_rolling_switch/lite_rolling_switch.dart';
//import 'package:toggle_switch/toggle_switch.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CasesScreen extends StatefulWidget {

  final dynamic globalData, countryData;

  CasesScreen({this.globalData, this.countryData});

  @override
  _CasesScreenState createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {

  Color activeTextColor = Color(0xffffffff);
  Color inActiveTextColor = Color(0xffb5d2b5);

  Color text_1 = Color(0xffffffff);
  Color text_2 = Color(0xffb5d2b5);
  Color text_3 = Color(0xffb5d2b5);

  Color activeButtonStyle = Colors.white;
  Color inActiveButtonStyle = Color(0xff6C65AC);
  Color index_1Color = Colors.white;
  Color index_2Color = Color(0xff6C65AC);

  String affectedNumber, deathNumber, seriousNumber, recoveredNumber, activeNumber;

  var myGlobalDataMap, myCountryDataMap, dataBuffer;
  @override
  void initState() {
    super.initState();
    myGlobalDataMap = widget.globalData;
    myCountryDataMap = widget.countryData;
    dataBuffer = myCountryDataMap;
//    print(myCountryDataMap);
//    print(myGlobalDataMap);
  }
  @override
  Widget build(BuildContext context) {

    void updateDataBuffer(int index) {
      if(index == 1) {
        dataBuffer = myCountryDataMap;
      } else if (index == 2) {
        dataBuffer = myGlobalDataMap;
      }
//      print(dataBuffer);
    }


    void updateColor(int index) {
      if (index == 1) {
        index_1Color = activeButtonStyle;
        index_2Color = inActiveButtonStyle;
      } else if (index == 2) {
        index_2Color = activeButtonStyle;
        index_1Color = inActiveButtonStyle;
      }
    }

    void updateColorAndUI (int index) {
      if (index == 1) {
        text_1 = activeTextColor;
        text_2 = text_3 = inActiveTextColor;
      } else if (index == 2) {
        text_2 = activeTextColor;
        text_1 = text_3 = inActiveTextColor;
      } else if (index == 3) {
        text_3 = activeTextColor;
        text_1 = inActiveTextColor;
        text_2 = inActiveTextColor;
      }
    }


    Future<bool> _willPopCallback() async {
      // await showDialog or Show add banners or whatever
      // then
      return true; // return true if the route to be popped
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: _willPopCallback,

        child: Scaffold(
          appBar: AppBar(
            
            elevation: 0.0,
            backgroundColor: Color(0xff4f3f9f),
          ),
          backgroundColor: Color(0xff4f3f9f),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(                                      
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('Statistics',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(      // this is switching button
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xff6C65AC),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  color: index_1Color,
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  onPressed: () {
                                    setState(() {
                                      updateColor(1);
                                      updateDataBuffer(1);
                                    });
                                  },
                                  child: Text('My Country',
                                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  elevation: 0.0,
                                ),
                              ),
                              Expanded(
                                child: RaisedButton(
                                  color: index_2Color,
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  onPressed: () {
                                    setState(() {
                                      updateColor(2);
                                      updateDataBuffer(2);
                                    });
                                  },
                                  child: Text('Globally',
                                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  elevation: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Text('Total',
                                style: TextStyle(color: text_1, fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              onTap: () {
                                setState(() {
                                  updateColorAndUI(1);
                                });
                              },
                            ),
//                            GestureDetector(
//                              child: Text('Yesterday',
//                                style: TextStyle(color: text_2, fontWeight: FontWeight.bold, fontSize: 20.0),
//                              ),
//                              onTap: () {
//                                setState(() {
//                                  updateColorAndUI(2);
//                                });
//                              },
//                            ),
//                            GestureDetector(
//                              child: Text('Last week',
//                                style: TextStyle(color: text_3, fontWeight: FontWeight.bold, fontSize: 20.0),
//                              ),
//                              onTap: () {
//                                print('weo');
//                                setState(() {
//                                  updateColorAndUI(3);
//                                });
//                              },
//                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: ColourCard(
                                    cardColor: Color(0xffffb259),
                                    cardTitle: 'Affected',
                                    number: dataBuffer['cases'].toString(),
                                  )
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: ColourCard(
                                    cardColor: Color(0xffff5959),
                                    cardTitle: 'Death',
                                    number: dataBuffer['deaths'].toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: ColourCard(
                                      cardColor: Color(0xff4cd97b),
                                      cardTitle: 'Recovered',
                                      number: dataBuffer['recovered'].toString(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: ColourCard(
                                      cardColor: Color(0xff4cb5ff),
                                      cardTitle: 'Active',
                                      number: dataBuffer['active'].toString(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: ColourCard(
                                      cardColor: Color(0xff9059ff),
                                      cardTitle: 'Serious',
                                      number: dataBuffer['critical'].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    color: Color(0xff4f3f9f),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xff4cf9ff),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    child: ColourCard(
                                      cardColor: Color(0xffffb259),
                                      cardTitle: 'Today Cases',
                                      number: dataBuffer['todayCases'].toString(),
                                    )
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: ColourCard(
                                    cardColor: Color(0xffff5959),
                                    cardTitle: 'Today Deaths',
                                    number: dataBuffer['todayDeaths'].toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
//                        SizedBox(
//                          height: ,
//                        ),
                        Container(
                          color: Color(0xff4cf9ff),
                          height: 30.0,
                          width: double.infinity,
                          child: Center(child: Text('STAY HOME AND STAY SAFE',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xff464847)),
                          ),),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ColourCard extends StatelessWidget {

  final Color cardColor;
  final String cardTitle, number;

  ColourCard({this.cardColor, this.cardTitle, this.number});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(cardTitle,
              style: TextStyle(color: Color(0xfffff4e8), fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
            Text(number,
              style: TextStyle(color: Color(0xfffff4e8), fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColor,
      ),
    );
  }
}


