import 'package:flutter/material.dart';
import '../model/nasa_mars_rover_api_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:mars_rover_nasa_api_project/utilities/constants.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen(
      {Key? key, required this.dataModel, required this.cameName})
      : super(key: key);

  final NASAMarsRoverPhotosAPIModel dataModel;
  final String cameName;

  Widget build(BuildContext context) {
    List<int?> cameraPhotos() {
      int index = dataModel.photos!.length;
      List<int?> photosIndex = [];
      for (int i = 0; i < index; i++) {
        if (dataModel.photos![i]!.camera!.fullName == cameName) {
          photosIndex.add(i);
        }
      }
      return photosIndex;
    }

    var photoIn = cameraPhotos();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          dataModel.photos![photoIn[0]!]!.camera!.fullName.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: ListView.builder(
        itemCount: photoIn.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: kPhotoCardsDecoration,
                  child: Column(
                    children: [
                      ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: dataModel.photos![photoIn[index]!]!.imgSrc
                              .toString(),
                          placeholder: (context, url) => Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Lottie.asset(
                              'images/loading.json',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'Earth Date: ' +
                              dataModel.photos![photoIn[index]!]!.earthDate
                                  .toString(),
                          style: kEarthDateTextStyle,
                        ),
                      ),
                    ],
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
