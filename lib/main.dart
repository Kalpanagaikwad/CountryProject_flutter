import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_country/Country.dart';

import 'ApiServices.dart';
import 'CountryDataList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Country Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 // with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
  new GlobalKey<ScaffoldState>();
  //final _debouncer = Debouncer(milliseconds: 500);
  List<Country> countries = List();
  List<Country> filteredCountries = List();
  TextEditingController controller = new TextEditingController();
  bool _isSearching = false;
  String _searchResult = '';
  @override
  void initState() {
    super.initState();
   // _searchQuery = new TextEditingController();
    //Call Api from ApiServices
    ApiServices.getCountry().then((countriesFromServer) {
      setState(() {
        countries = countriesFromServer;
        filteredCountries = countries;
      });
    });
  }



  //List<Country> filteredRecored;

  // @override
  // void initState() {
  //   super.initState();
  //   _searchQuery = new TextEditingController();
  //   fetchCountry(new http.Client()).then((String) {
  //     parseData(String);
  //   });
  // }
  //
  // List<Country> allRecord;
  //
  // parseData(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   setState(() {
  //     allRecord =
  //         parsed.map<Country>((json) => new Country.fromJson(json)).toList();
  //   });
  //   filteredRecored = new List<Country>();
  //   filteredRecored.addAll(allRecord);
  // }

  // void _startSearch() {
  //
  //   ModalRoute.of(context)
  //       .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));
  //
  //   setState(() {
  //     _isSearching = true;
  //   });
  // }

  // void _stopSearching() {
  //   _clearSearchQuery();
  //
  //   setState(() {
  //     _isSearching = false;
  //     filteredCountries.addAll(countries);
  //   });
  // }

  // void _clearSearchQuery() {
  //   setState(() {
  //     _searchQuery.clear();
  //     updateSearchQuery("Search query");
  //   });
  // }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
    Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            new Text('Seach box',
              style: new TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }

  // Widget _buildSearchField() {
  //   return new TextField(
  //     controller: _searchQuery,
  //     autofocus: true,
  //     decoration: const InputDecoration(
  //       hintText: 'Search...',
  //       border: InputBorder.none,
  //       hintStyle: const TextStyle(color: Colors.white30),
  //     ),
  //     style: const TextStyle(color: Colors.white, fontSize: 16.0),
  //     onChanged: updateSearchQuery,
  //   );
  // }

  void updateSearchQuery(String newQuery) {
    filteredCountries.clear();
    if (newQuery.length > 0) {
      Set<Country> set = Set.from(countries);
      set.forEach((element) => filterList(element, newQuery));
    }

    if (newQuery.isEmpty) {
      filteredCountries.addAll(countries);
    }

    setState(() {});
  }

  filterList(Country country, String searchQuery) {
    setState(() {
      if (country.name.toLowerCase().contains(searchQuery) ||
          country.name.contains(searchQuery)) {
        filteredCountries.add(country);
      }
    });
  }

  // List<Widget> _buildActions() {
  //   if (_isSearching) {
  //     return <Widget>[
  //       new IconButton(
  //         icon: const Icon(Icons.clear,color: Colors.white,),
  //         onPressed: () {
  //           if (_searchQuery == null || _searchQuery.text.isEmpty) {
  //             Navigator.pop(context);
  //             return;
  //           }
  //           _clearSearchQuery();
  //         },
  //       ),
  //     ];
  //   }
  //
  //   return <Widget>[
  //     new IconButton(
  //       icon: const Icon(Icons.search,color: Colors.white,),
  //       onPressed: _startSearch,
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     // key: scaffoldKey,
      appBar: new AppBar(
        backgroundColor:Color(0xFF007bff),
        title: new Text('All Country'),
        elevation: 0.0,
      ),
      // appBar: new AppBar(
      //   leading: _isSearching ? new BackButton( color: Colors.white,) : null,
      //   title: _isSearching ? _buildSearchField() : _buildTitle(context),
      //   actions: _buildActions(),
      // ),


      body:
      new Column(

          children: <Widget>[
      new Container(
      color: Theme
          .of(context)
          .primaryColor,
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Card(
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: new TextField(
                controller: controller,
                decoration: new InputDecoration(
                    hintText: 'Search by Name,capital,Population,Currency', border: InputBorder.none),


                //AllUsersApiResdata1->countries
                // usersFiltered->filteredCountries
                //usersFiltered1->filteredCountries1
                onChanged: (value) {
                  _searchResult = value;
                  if (_searchResult.isEmpty) {
                    setState(() {
                      filteredCountries = countries;
                    });
                    return;
                  }
                  List<Country> filteredCountries1 = [];
                  filteredCountries1.clear();
                  countries.forEach((countryDetail) {
                    if (countryDetail.name.toUpperCase().contains(_searchResult.toUpperCase()) ||
                        countryDetail.population.toString().toUpperCase().contains(_searchResult.toUpperCase())
                        || countryDetail.capital.toUpperCase().contains(_searchResult.toUpperCase())
                        || countryDetail.currencies[0].name.toUpperCase().contains(_searchResult.toUpperCase())
                    )
                      filteredCountries1.add(countryDetail);
                    //name sorting
                   filteredCountries1.sort((a, b) => a.name.compareTo(b.name));
                   //capital name
                    filteredCountries1.sort((a, b) => a.capital.compareTo(b.capital));
                    //currency
                    filteredCountries1.sort((a, b) => a.currencies[0].name.compareTo(b.currencies[0].name));
                    // descending order population
                    filteredCountries1.sort((a, b) => b.population.compareTo(a.population));
                    //filteredCountries1.sort((a, b) => a.compareTo(b));
                  });
                  setState(() {
                    filteredCountries = filteredCountries1;
                    //.where((user) => user.firstName.toUpperCase().contains(_searchResult)||user.lastName.toUpperCase().contains(_searchResult) || user.role.toUpperCase().contains(_searchResult)||user.email.toUpperCase().contains(_searchResult)).toList();
                  });
                }),
            trailing: new IconButton(
              icon: new Icon(Icons.cancel), onPressed: () {
              setState(() {
                controller.clear();
                _searchResult = '';
                filteredCountries = countries;
              });
            },
            ), //
          ),
        ),
      ),
    ),
    Expanded(
      child: filteredCountries != null && filteredCountries.length > 0
          ? new CountryDataList(country: filteredCountries)
          : countries == null
          ? new Center(child: new CircularProgressIndicator())
          : new Center(
        child: new Text("No recored match found!"),
      ),
    ),
    ]
    ),
    );
  }
}