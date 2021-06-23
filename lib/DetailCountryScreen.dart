import 'package:flutter/material.dart';
import 'package:flutter_app_country/Country.dart';

class DetailCountryScreen extends StatefulWidget {
  final Country country;
  final BuildContext context;
  DetailCountryScreen(this.context,this.country);

  @override
  _DetailCountryScreenState createState() => _DetailCountryScreenState();

}

class _DetailCountryScreenState extends State<DetailCountryScreen> {
  String contryBorder="";
  String callingCodes="";


  @override
  void initState() {
    super.initState();
   //
    for (int i = 0; i < widget.country.borders.length; i++) {
      contryBorder += widget.country.borders[i];
      if (i <widget.country.borders.length - 1) contryBorder += ", ";
    }

    //callingCodes

    for (int i = 0; i <  widget.country.callingCodes.length; i++) {
      callingCodes +=  widget.country.callingCodes[i];
      if (i < widget.country.callingCodes.length - 1) callingCodes += ", ";
    }
  }

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new

        Scaffold(
          // drawer: NavigationMenu(),
          //  drawer: NavigationMenu(),

          appBar: AppBar(
            backgroundColor: Color(0xFF007bff),
            title:Text(widget.country.name, style: TextStyle(color: Colors.white,
              fontSize: 20.0,
            ),
            ),
          ),
            body: Container(

        child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 10.0,
            width: 10.0,
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(widget.country.name+" Information",style: TextStyle(color: Colors.black,fontSize: 30.0,),textAlign: TextAlign.center,),
            ),
          ),
          SizedBox(
            height: 15.0,
            width: 10.0,
          ),
          Container(
            //height: 200,
            height: MediaQuery.of(context).size.height*.60,

           // width = MediaQuery.of(context).size.width,

            margin:  EdgeInsets.only(top: 5.0, right: 10.0, left: 10.0),

            child: Table(

                border: TableBorder.all(width: 1),

                children: [
                  TableRow(
                      children: [

                        Text("Name", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,
                        ), textWidthBasis: TextWidthBasis.longestLine,
                            textAlign: TextAlign.center),
                        Text(widget.country.name,
                            style: TextStyle(color: Colors.black,
                              fontSize: 30.0,
                            ), textScaleFactor: 1,
                            textAlign: TextAlign.center),
                        // Text("University",textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Capital", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,
                        ),
                            textAlign: TextAlign.center),
                        Text(widget.country.capital,
                            style: TextStyle(color: Colors.black,
                              fontSize: 30.0,
                            ),
                            textAlign: TextAlign.center),
                        // Text("AKTU",textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Population", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        Text(widget.country.population.toString(), style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        //Text("CBSE",textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Currency", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        Text(widget.country.currencies[0].name, style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        //Text("CBSE",textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Calling Code", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        Text(callingCodes, style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        //Text("CBSE",textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Region", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        Text(widget.country.region, style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        //Text("CBSE",textScaleFactor: 1.5),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("List of bordering Countries Code", style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        Text(contryBorder, style: TextStyle(color: Colors.black,
                          fontSize: 30.0,),
                            textAlign: TextAlign.center),
                        //Text("CBSE",textScaleFactor: 1.5),
                      ]
                  ),
                ]
            ),
          ),


        ])

    ),
    )
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.pop(widget.context);
  }
}
