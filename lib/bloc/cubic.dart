import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/model/model_edite.dart';

import 'package:foodapp/model/model_shop.dart';
import 'package:foodapp/model/model_details_services.dart';
import 'package:foodapp/shared/network/remot/local/cache_helper.dart';

import 'package:http/http.dart' as http;
import 'package:foodapp/shared/network/remot/remote/dio_helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';

class AppCubic extends Cubit<AppStates> {
  AppCubic() : super(InitailAppStates());

  static AppCubic get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  void changeBottom(int index) {
    selectedIndex = index;
    emit(ChangeBottomAppState());
  }

  int counter = 0;

  void incrementCounter() {
    counter++;
    emit(incrementCounterAppState());
  }

  void decrementCounter() {
    counter--;
    emit(decrementCounterAppState());
  }

  bool color = false;

  void changeColor(value) {
    color = value;
    emit(ChangeColorAppState());
  }

  int selectedIndexCard = 0;

  void changeCard(int index) {
    selectedIndexCard = index;
    emit(ChangeBottomAppState());
  }

  int CurrentPage = 0;

  void ChangePage(int index) {
    CurrentPage = index;
    emit(ChangeDrawerButtonState());
  }

  void getCurrentLocation() async {
    print('------------------++++++++++++++++++++++++++++++++++');
    await Geolocator.checkPermission().then((value) async {
      print('request_Permission$value');
      if (value == LocationPermission.denied) {
        Geolocator.requestPermission().then((value) {
          if (value == LocationPermission.denied) {
            print('Need Permission to get Location');
            emit(PermissionfailedState());
          } else {
            getPosition();
          }
        });
      } else {
        getPosition();
      }
    });
  }

  LatLng? myLocation;

  Future<void> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@');
    // print('${position.latitude}-${position.longitude}

    myLocation = LatLng(position.latitude, position.longitude);

    GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude)
        .then((value) =>
        print('placeMark =========${value[0].name}${value[0].locality}'));
    emit(SuccessPositionState());
  }

  bool? result;

  void checkEnternet() async {
    bool result1 = await InternetConnectionChecker().hasConnection;
    if (result1 == true) {
      print(' Connection Done ');
      emit(ConnectionDoneEnternetState());
    } else {
      print(' Connection failed ');
      emit(ErrorcheckEnternetState());
    }
    result = result1;
    emit(checkEnternetState());
  }

  List<Marker> markers = [];

  void listmarkers(latitude, longitude, ckeck) {
    if (ckeck == true) markers.clear();
    markers.add(
      Marker(
          anchorPos: AnchorPos.align(AnchorAlign.center),
          height: 30,
          width: 30,
          point: LatLng(ckeck == false ? myLocation!.latitude : latitude,
              ckeck == false ? myLocation!.longitude : longitude),
          builder: (BuildContext context) {
            return Icon(Icons.location_on, size: 30,);
          }),
    );
    emit(newPositionState());
  }

  List? Popservices;

  void getPopservices() async {
    emit(LoadingPopservicesState());
    await DioHelper.getdata(url: 'mapapi/services.php', query: {
      'lang': 'ar',
      'lat': '30.0374562',
      'long': '31.2095052',
      'pop': '1',
      'shop': '8',
    }).then((value) async {
      print(value.data.runtimeType);

      Popservices = await jsonDecode(value.data);
      print('itemdetail${Popservices}');

      emit(SuccessPopservicesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorPopservicesState(error.toString()));
    });
  }

  ModeldetailsServices? detailsServices;

  void getdetailsservices(idservice) async {
    emit(LoadingdetailsServicesState());
    await DioHelper.getdata(url: 'mapapi/service.php', query: {
      'lang': 'ar',
      'service': '${idservice}',
    }).then((value) async {
      print(value.data.runtimeType);

      detailsServices =
      await ModeldetailsServices.fromJson(jsonDecode(value.data));
      print('itemdetail${detailsServices}');

      emit(SuccessdetailsServicesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrordetailsServicesState(error.toString()));
    });
  }

  List? allservices;

  void getAllservices() async {
    emit(LoadingAllservicesState());
    await DioHelper.getdata(url: 'mapapi/services.php', query: {
      'lang': 'ar',
      'shop': '8',
    }).then((value) async {
      print(value.data.runtimeType);

      allservices = await jsonDecode(value.data);
      print('allservices${allservices!.length}');

      emit(SuccessAllservicesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAllservicesState(error.toString()));
    });
  }

  ModelShop? shop;

  void getshop() async {
    emit(LoadingShopState());
    await DioHelper.getdata(url: 'mapapi/shop.php', query: {
      'lang': 'ar',
      'shop': '18',
    }).then((value) async {
      print(value.data.runtimeType);

      shop = await ModelShop.fromJson(jsonDecode(value.data));
      print('shop${shop!}');

      emit(SuccessShopState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorShopState(error.toString()));
    });
  }

  double? latitude;
  double? longitude;

  void savelastpostion(lastlatitude, lastlongitude) {
    latitude = lastlatitude;
    longitude = lastlongitude;

    emit(SavelastpostionState());
  }
  ModelEdite? upimage;
  void image()async{
    
    var request=await http.MultipartRequest('POST',Uri.parse('https://ibtikarsoft.net/mapapi/post.php'));

   var image= await http.MultipartFile.fromBytes('file' ,File(postImage!.path).readAsBytesSync(),filename: postImage!.path);
    request.files.add(image);
    var response= await request.send();
    var responseDate=await response.stream.toBytes();
    var result=String.fromCharCodes(responseDate);
    upimage= ModelEdite.fromJson(jsonDecode(result));
    print(upimage!.file);
    emit(SuccessUploadImageState());

  }
  int? indexService  ;

  void changeBottomService(index) {
    indexService = index;
    emit(changeBottomServiceState());
  }
  ModelEdite? modeledite;
  FormData formData = new FormData();

  void editeUser({ required name,required type,required adress,required date,required phone,required late,required long,required file, }) async{
    print('enter');
    emit(LoadingEditeUserState());
     formData = FormData.fromMap({
      "name": "${name}",
      "type": "${type}",
      "adress":"${adress}",
      "date": "${date}",
      "phone":"${phone}",
      "late": "${late}",
      "long": "${long}",
      "file":"${file}",
    });

  await DioHelper.postdata(url: 'mapapi/post.php', data: formData,).then((value) {

      modeledite = ModelEdite.fromJson(jsonDecode(value.data));
      print(modeledite!.file);
      print(value.data);
      emit(SuccessEditeUserState());
    }).catchError((error) {
      emit(ErrorEditeUserState(error.toString()));
      print(error.toString());
    });
  }
  File? postImage;
  String profileImageUrl = '';
  final picker = ImagePicker();
  PickedFile? pickedFile;
  Future<void> PostImage() async {

    pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    emit(LoadingPostImageState());
    if (pickedFile != null ) {


      postImage = File(pickedFile!.path);
      profileImageUrl=Uri.file(pickedFile!.path).pathSegments.last;

      image();

      emit(SuccessPostImageState());
    } else {
      print('No image selected.');
      emit(ErrorPostImageState());
    }
  }
  double? lat;
  double? long;
  String? Service;
  void saveEditeUser(){
    lat=CacheHelper.getData(key: 'lat');
    long=CacheHelper.getData(key: 'long');
    Service=CacheHelper.getData(key: 'service');
    print(lat);
    emit(savelatState());
  }
  void deleteEdite(){
    CacheHelper.removeData(key: 'lat');
    CacheHelper.removeData(key: 'long');
    CacheHelper.removeData(key: 'service');

    print(lat);
    emit(deletelatState());
  }



  bool buttontrue = true;

  void buttonCkeck(value) {
    buttontrue = value;

    emit(buttonCkeckState());
  }
  List? categories=[];

  void getCategories(cat) async {
    emit(LoadingTypecategoriesState());
    await DioHelper.getdata(url: 'mapapi/categories.php', query: {
      'lang': 'ar',
      'cat': '${cat}',
    }).then((value)async {
      print(value.data.runtimeType);

      categories = await jsonDecode(value.data);

      print('cato++++++++++${categories!}');
      emit(SuccessTypecategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorTypecategoriesState(error.toString()));
    });
  }
}
