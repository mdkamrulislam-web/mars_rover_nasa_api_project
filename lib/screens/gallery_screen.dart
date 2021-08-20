import 'package:flutter/material.dart';
import '../model/nasa_mars_rover_api_model.dart';
import '../utilities/constants.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key, required this.dataModel}) : super(key: key);

  final NASAMarsRoverPhotosAPIModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mars Rover Gallery'),
      ),
      body: ListView.builder(
        itemCount: dataModel.photos!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Text(
                'Camera Name',
                style: kRoverDetailsTextStyle,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    dataModel.photos![index]!.camera!.fullName.toString(),
                    textAlign: TextAlign.center,
                    style: kRoverCameraFullNameTextStyle,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: Text(
                    "(" +
                        dataModel.photos![index]!.camera!.name.toString() +
                        ")",
                    textAlign: TextAlign.center,
                    style: kRoverCameraCodeNameTextStyle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}
