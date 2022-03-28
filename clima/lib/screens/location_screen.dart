import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

import '../services/location.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final map;

  LocationScreen(this.map);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String city = '';
  double temp = 0.0;
  String des = '';
  int id = 0;
  String have = '';

  var map;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.map);
    map = widget.map;
    updateUI(map);
  }

  void updateUI(dynamic map) {
    setState(() {
      print(map);
      if (map == null) {
        temp = 0;
        city = 'Error in city name or api not working try again after few time';
      } else {
        temp = map['main']['temp'];
        city = map['name'];
        des = map['weather'][0]['description'];
        id = map['weather'][0]['id'];
        have = weatherModel.getMessage(temp.toInt());
      }
    });
  }

  WeatherModel weatherModel = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      Location location = Location();
                      map = await location.getLocation();
                      updateUI(map);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityNAme = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      print(cityNAme);
                      if (cityNAme != null) {
                        Location location = Location();
                        map = await location.cityLocation(cityNAme);
                        updateUI(map);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(id),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Center(
                  child: Text(
                    "$have  in  $city!  $des at this time",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
