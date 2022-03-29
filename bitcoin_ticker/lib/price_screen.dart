import 'dart:convert';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}
//

class _PriceScreenState extends State<PriceScreen> {
  String mainValue = 'USD';

  double rate = 0.0;
  double rate2 = 0.0;
  double rate3 = 0.0;

  List<DropdownMenuItem<String>> getList() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String curr in currenciesList) {
      var newItems = DropdownMenuItem(
        child: Text(curr),
        value: curr,
      );

      dropDownItems.add(newItems);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $rate $mainValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETC = $rate2 $mainValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $rate3 $mainValue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                value: mainValue,
                items: getList(),
                onChanged: (value) async {
                  var url = Uri.parse(
                      "https://rest.coinapi.io/v1/exchangerate/BTC/$mainValue");
                  var url2 = Uri.parse(
                      "https://rest.coinapi.io/v1/exchangerate/ETC/$mainValue");
                  var url3 = Uri.parse(
                      "https://rest.coinapi.io/v1/exchangerate/LTC/$mainValue");

                  NetWorkHelper netWorkHelper = NetWorkHelper(url);
                  var data = await netWorkHelper.getData();
                  NetWorkHelper netWorkHelper2 = NetWorkHelper(url2);
                  var data2 = await netWorkHelper2.getData();
                  NetWorkHelper netWorkHelper3 = NetWorkHelper(url3);
                  var data3 = await netWorkHelper3.getData();

                  if (value != null) {
                    setState(() {
                      mainValue = value.toString();
                      rate = data['rate'];
                      rate2 = data2['rate'];
                      rate3 = data3['rate'];
                    });
                  }
                  print(value);
                }),
          ),
        ],
      ),
    );
  }
}

class widget {}
