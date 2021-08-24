import 'package:flutter/material.dart';
import '../../model/nasa_mars_rover_api_model.dart';
import 'package:mars_rover_nasa_api_project/screens/gallery_screen.dart';

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
        //print(x);
        list.add(x);
        //print(i);
      }
      //print(list);
      var a = list.toSet().toList();
      //print(a);
      return a;
    }

    var camList = newList();
    String cameNam;

    return ListView.builder(
        itemCount: camList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
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
              // TextButton.styleFrom(
              //     primary: Colors.white,
              //     backgroundColor: Colors.blue,
              //     shadowColor: Colors.blueAccent),
              onPressed: () async {
                cameNam = camList[index]!;
                //print(cameNam);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GalleryScreen(
                        dataModel: dataModel,
                        cameName: cameNam,
                      );
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  camList[index]!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
  }
}
