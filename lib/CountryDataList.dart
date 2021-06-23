import 'package:flutter/material.dart';

import 'Country.dart';
import 'DetailCountryScreen.dart';


class CountryDataList extends StatelessWidget {
  final List<Country> country;

  CountryDataList({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: Container(
            child: Card(

              child: new Container(
                child: new Center(
                    child: new Column(
                      // Stretch the cards in horizontal axis
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        new Text(
                          // Read the name field value and set it in the Text widget
                          country[index].name,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          // Read the name field value and set it in the Text widget
                          "Capital:- " + country[index].capital,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                        new Text(
                          // Read the name field value and set it in the Text widget
                          "Population:- " + country[index].population.toString(),
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                        new Text(
                          // Read the name field value and set it in the Text widget
                          "Currency:- " + country[index].currencies[0].name,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                      ],
                    )),
                padding: const EdgeInsets.all(15.0),
              ),
            )
            ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCountryScreen(context,country[index]),
                ),
            );
          },
          );

        });
  }
}