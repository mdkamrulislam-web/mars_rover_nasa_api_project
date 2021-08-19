import 'dart:convert';
import 'result_view.dart';
import 'package:flutter/material.dart';
import 'package:mars_rover_nasa_api_project/API_KEY.dart';
import 'package:mars_rover_nasa_api_project/constants.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rover_nasa_api_project/nasa_mars_rover_api_model.dart';
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

    // if (response.statusCode == 200) {
    //   print(response.statusCode);
    //
    //   NASAMarsRoverPhotosAPIModel dataModel =
    //       NASAMarsRoverPhotosAPIModel.fromJson(jsonDecode(response.body));
    //
    //   var imageSource = dataModel.photos![0]!.imgSrc;
    //   //print(imageSource);
    //   var dateOnEarth = dataModel.photos![0]!.earthDate;
    //   var landingDate = dataModel.photos![0]!.rover!.landingDate;
    //   var roverLandingDate = dataModel.photos![0]!.rover!.landingDate;
    //   var roverLaunchingDate = dataModel.photos![0]!.rover!.launchDate;
    //   var roverID = dataModel.photos![0]!.rover!.id;
    //   var roverStatus = dataModel.photos![0]!.rover!.status;
    //   var cameraID = dataModel.photos![0]!.camera!.id;
    //   var cameraCode = dataModel.photos![0]!.camera!.name;
    //   var cameraFullName = dataModel.photos![0]!.camera!.fullName;
    //   var photoID = dataModel.photos![0]!.id;
    //
    //   nasaData = dataModel;
    //
    // } else {
    //   print(response.statusCode);
    // }
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
            'CURIOSITY',
          ),
        ),
      ),
      body: FutureBuilder<NASAMarsRoverPhotosAPIModel>(
        future: nasaData,
        builder: (BuildContext context,
            AsyncSnapshot<NASAMarsRoverPhotosAPIModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            NASAMarsRoverPhotosAPIModel dataModel = snapshot.data!;
            return ResultView(dataModel: dataModel);
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
