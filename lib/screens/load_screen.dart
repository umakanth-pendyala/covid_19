import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19/services/covid_helper.dart';
import 'package:covid19/screens/cases_screen.dart';

class LoadScreen extends StatefulWidget {
  final bool loadData;
  LoadScreen({this.loadData});

  @override
  _LoadScreenState createState() => _LoadScreenState();

}

class _LoadScreenState extends State<LoadScreen> {

  @override
   void initState() {
    super.initState();
  }


  Future<void> getInformationAboutCovid() async {
    CovidInfo infoObject = new CovidInfo();
    var globalData = await infoObject.getGlobally();
    var countryData = await infoObject.getTotalInACountry('india');
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CasesScreen(globalData: globalData, countryData: countryData,);
    }));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    if (widget.loadData == false) {
      Navigator.pop(context);
    }

    getInformationAboutCovid();

    Future<bool> _willPopCallback() async {
      // await showDialog or Show add banners or whatever
      // then
      return true; // return true if the route to be popped
    }


    return WillPopScope(

      onWillPop: _willPopCallback,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}



