import 'package:flutter/material.dart';
import '../../model/nasa_mars_rover_api_model.dart';
import 'package:mars_rover_nasa_api_project/screens/gallery_screen.dart';
import 'package:mars_rover_nasa_api_project/utilities/constants.dart';

class CameraList extends StatelessWidget {
  const CameraList({Key? key, required this.dataModel}) : super(key: key);

  final NASAMarsRoverPhotosAPIModel dataModel;

  @override
  Widget build(BuildContext context) {
    List<String?> newList() {
      int index = dataModel.photos!.length;
      List<String?> list = [];
      for (int i = 0; i < index; i++) {
        String? x = dataModel.photos![i]!.camera!.fullName;
        list.add(x);
      }
      var a = list.toSet().toList();
      return a;
    }

    List<int?> camIDList() {
      int index = dataModel.photos!.length;
      List<int?> camId = [];
      for (int i = 0; i < index; i++) {
        int? y = dataModel.photos![i]!.camera!.id;
        camId.add(y);
      }
      var b = camId.toSet().toList();

      return b;
    }

    var camList = newList();
    var camIDS = camIDList();
    String camNam;
    int camID;

    return ListView.builder(
        itemCount: camList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue,
                ),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
                overlayColor: MaterialStateProperty.all(
                  Colors.teal,
                ),
                elevation: MaterialStateProperty.all(5),
              ),
              onPressed: () async {
                camNam = camList[index]!;
                //print(camNam);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GalleryScreen(
                        dataModel: dataModel,
                        cameName: camNam,
                      );
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Column(
                  children: [
                    Text(
                      camList[index]!,
                      style: kCameraNameTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Camera ID: ' + camIDS[index]!.toString(),
                      style: kCameraNameTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
