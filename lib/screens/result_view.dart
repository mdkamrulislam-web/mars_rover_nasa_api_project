import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/nasa_mars_rover_api_model.dart';
import '../utilities/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.dataModel}) : super(key: key);

  final NASAMarsRoverPhotosAPIModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Curiosity | Photos',
        ),
      ),
      body: ListView.builder(
          itemCount: dataModel.photos!.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      child: CachedNetworkImage(
                        imageUrl: dataModel.photos![index]!.imgSrc!,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 20.0, bottom: 5.0),
                      child: Center(
                        child: Text(
                          'Earth Date: ' +
                              dataModel.photos![index]!.earthDate.toString(),
                          textAlign: TextAlign.left,
                          style: kRoverVoyageDateTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 35, right: 35, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.black54,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Camera Name',
                              style: kRoverDetailsTextStyle,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  dataModel.photos![index]!.camera!.fullName
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: kRoverCameraFullNameTextStyle,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 16),
                                child: Text(
                                  "(" +
                                      dataModel.photos![index]!.camera!.name
                                          .toString() +
                                      ")",
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
                ),
              ),
            );
          }),
    );
  }
}
