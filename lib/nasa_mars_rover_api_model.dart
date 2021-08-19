class NASAMarsRoverPhotosAPIModelPhotosRover {
/*
{
  "id": 5,
  "name": "Curiosity",
  "landing_date": "2012-08-06",
  "launch_date": "2011-11-26",
  "status": "active"
}
*/

  int? id;
  String? name;
  String? landingDate;
  String? launchDate;
  String? status;

  NASAMarsRoverPhotosAPIModelPhotosRover({
    this.id,
    this.name,
    this.landingDate,
    this.launchDate,
    this.status,
  });
  NASAMarsRoverPhotosAPIModelPhotosRover.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    landingDate = json["landing_date"]?.toString();
    launchDate = json["launch_date"]?.toString();
    status = json["status"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["landing_date"] = landingDate;
    data["launch_date"] = launchDate;
    data["status"] = status;
    return data;
  }
}

class NASAMarsRoverPhotosAPIModelPhotosCamera {
/*
{
  "id": 20,
  "name": "FHAZ",
  "rover_id": 5,
  "full_name": "Front Hazard Avoidance Camera"
}
*/

  int? id;
  String? name;
  int? roverId;
  String? fullName;

  NASAMarsRoverPhotosAPIModelPhotosCamera({
    this.id,
    this.name,
    this.roverId,
    this.fullName,
  });
  NASAMarsRoverPhotosAPIModelPhotosCamera.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    roverId = json["rover_id"]?.toInt();
    fullName = json["full_name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["rover_id"] = roverId;
    data["full_name"] = fullName;
    return data;
  }
}

class NASAMarsRoverPhotosAPIModelPhotos {
/*
{
  "id": 102693,
  "sol": 1000,
  "camera": {
    "id": 20,
    "name": "FHAZ",
    "rover_id": 5,
    "full_name": "Front Hazard Avoidance Camera"
  },
  "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
  "earth_date": "2015-05-30",
  "rover": {
    "id": 5,
    "name": "Curiosity",
    "landing_date": "2012-08-06",
    "launch_date": "2011-11-26",
    "status": "active"
  }
}
*/

  int? id;
  int? sol;
  NASAMarsRoverPhotosAPIModelPhotosCamera? camera;
  String? imgSrc;
  String? earthDate;
  NASAMarsRoverPhotosAPIModelPhotosRover? rover;

  NASAMarsRoverPhotosAPIModelPhotos({
    this.id,
    this.sol,
    this.camera,
    this.imgSrc,
    this.earthDate,
    this.rover,
  });
  NASAMarsRoverPhotosAPIModelPhotos.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    sol = json["sol"]?.toInt();
    camera = (json["camera"] != null)
        ? NASAMarsRoverPhotosAPIModelPhotosCamera.fromJson(json["camera"])
        : null;
    imgSrc = json["img_src"]?.toString();
    earthDate = json["earth_date"]?.toString();
    rover = (json["rover"] != null)
        ? NASAMarsRoverPhotosAPIModelPhotosRover.fromJson(json["rover"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["sol"] = sol;
    if (camera != null) {
      data["camera"] = camera!.toJson();
    }
    data["img_src"] = imgSrc;
    data["earth_date"] = earthDate;
    if (rover != null) {
      data["rover"] = rover!.toJson();
    }
    return data;
  }
}

class NASAMarsRoverPhotosAPIModel {
/*
{
  "photos": [
    {
      "id": 102693,
      "sol": 1000,
      "camera": {
        "id": 20,
        "name": "FHAZ",
        "rover_id": 5,
        "full_name": "Front Hazard Avoidance Camera"
      },
      "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
      "earth_date": "2015-05-30",
      "rover": {
        "id": 5,
        "name": "Curiosity",
        "landing_date": "2012-08-06",
        "launch_date": "2011-11-26",
        "status": "active"
      }
    }
  ]
}
*/

  List<NASAMarsRoverPhotosAPIModelPhotos?>? photos;

  NASAMarsRoverPhotosAPIModel({
    this.photos,
  });
  NASAMarsRoverPhotosAPIModel.fromJson(Map<String, dynamic> json) {
    if (json["photos"] != null) {
      final v = json["photos"];
      final arr0 = <NASAMarsRoverPhotosAPIModelPhotos>[];
      v.forEach((v) {
        arr0.add(NASAMarsRoverPhotosAPIModelPhotos.fromJson(v));
      });
      photos = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (photos != null) {
      final v = photos;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["photos"] = arr0;
    }
    return data;
  }
}
