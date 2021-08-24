import 'dart:convert';
import 'package:mars_rover_nasa_api_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_nasa_api_project/utilities/API_KEY.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rover_nasa_api_project/model/nasa_mars_rover_api_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Future<http.Response>

  Future<NASAMarsRoverPhotosAPIModel> fetchData() async {
    //return
    http.Response response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=$API_KEY'));

    final data =
        NASAMarsRoverPhotosAPIModel.fromJson(jsonDecode(response.body));

    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nasaData = fetchData();
  }

  late Future<NASAMarsRoverPhotosAPIModel> nasaData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Mars Rover Gallery',
            style: TextStyle(wordSpacing: 3.0),
          ),
        ),
      ),
      body: FutureBuilder<NASAMarsRoverPhotosAPIModel>(
        future: nasaData,
        builder: (BuildContext context,
            AsyncSnapshot<NASAMarsRoverPhotosAPIModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            NASAMarsRoverPhotosAPIModel dataModel = snapshot.data!;
            return AppHomeScreen(dataModel: dataModel);
            // ResultView(dataModel: dataModel);
          } else {
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.white,
                size: 100.0,
              ),
            );
          }
        },
      ),
    );
  }
}
