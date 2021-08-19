import 'package:flutter/material.dart';
import 'nasa_mars_rover_api_model.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.dataModel}) : super(key: key);

  final NASAMarsRoverPhotosAPIModel dataModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CachedNetworkImage(
          imageUrl: dataModel.photos![0]!.imgSrc!,
          placeholder: (context, url) => Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Lottie.asset(
              'images/loading.json',
              width: 200.0,
              height: 200.0,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Rover - " + dataModel.photos![0]!.rover!.name.toString(),
              style: kRoverNameTextStyle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: Center(
            child: Text(
              'Earth Date: ' + dataModel.photos![0]!.earthDate.toString(),
              textAlign: TextAlign.left,
              style: kRoverVoyageDateTextStyle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Expanded(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Status'.toUpperCase(),
                              style: kRoverDetailsTextStyle,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                dataModel.photos![0]!.rover!.status
                                    .toString()
                                    .toUpperCase(),
                                style: kRoverStatusTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Launched',
                                    style: kRoverLaunchLandTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.rocket,
                                    size: 50,
                                    color: Colors.orange,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    dataModel.photos![0]!.rover!.launchDate
                                        .toString(),
                                    style: kRoverLaunchLandDateTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Landed',
                                    style: kRoverLaunchLandTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Transform.rotate(
                                    angle: 90 * pi / 180,
                                    child: FaIcon(
                                      FontAwesomeIcons.rocket,
                                      size: 50,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    dataModel.photos![0]!.rover!.landingDate
                                        .toString(),
                                    style: kRoverLaunchLandDateTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 35, right: 35, bottom: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'CAMERA NAME',
                  style: kRoverDetailsTextStyle,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      dataModel.photos![0]!.camera!.fullName.toString(),
                      textAlign: TextAlign.center,
                      style: kRoverCameraFullNameTextStyle,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                    child: Text(
                      "(" + dataModel.photos![0]!.camera!.name.toString() + ")",
                      textAlign: TextAlign.center,
                      style: kRoverCameraCodeNameTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
