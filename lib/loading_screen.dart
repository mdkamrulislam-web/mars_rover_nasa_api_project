import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mars_rover_nasa_api_project/API_KEY.dart';
import 'package:mars_rover_nasa_api_project/constants.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rover_nasa_api_project/nasa_mars_rover_api_model.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Future<http.Response>

  fetchData() async {
    //return
    http.Response response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=$API_KEY'));

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      print(response.statusCode);

      var fullName = jsonDecode(data)['photos'][0]['camera']['full_name'];
      print(fullName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Mars Rovers',
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Image(
              image: NetworkImage(
                  "https://cdn.britannica.com/q:60/22/206222-050-3F741817/Domestic-feline-tabby-cat.jpg"),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                'Rover Name',
                style: kRoverNameTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: Text(
                'Date: 2021-08-09',
                textAlign: TextAlign.left,
                style: kRoverVoyageDateTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna al.',
                textAlign: TextAlign.justify,
                style: kRoverDetailsTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
