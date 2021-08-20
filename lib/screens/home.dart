import 'package:flutter/material.dart';
import 'package:mars_rover_nasa_api_project/screens/result_view.dart';
import '../model/nasa_mars_rover_api_model.dart';
import '../utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key, required this.dataModel}) : super(key: key);

  final NASAMarsRoverPhotosAPIModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                imageUrl:
                    'https://static.turbosquid.com/Preview/2017/03/27__04_08_24/curiosity.0004.jpg96EBDB6D-6D4F-4BAE-BE90-91FA54206393DefaultHQ.jpg',
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Lottie.asset(
                    'images/loading.json',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image(
              //   image: AssetImage(
              //     'images/rover.jpg',
              //   ),
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 30.0, top: 30.0),
            child: Center(
              child: Text(
                dataModel.photos![0]!.rover!.name.toString(),
                style: kRoverNameTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                    // Container(
                    //   width: 200,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black54,
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(10.0),
                    //     ),
                    //   ),
                    //   child:
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultView(dataModel: dataModel);
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.blue.shade900,
                                Colors.blue.shade500
                              ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            width: 200,
                            height: 75,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Gallery',
                                  style: kHomeButtonTextStyle,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
