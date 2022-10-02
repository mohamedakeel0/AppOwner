import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:foodapp/bloc/cubic.dart';
import 'package:foodapp/bloc/states.dart';
import 'package:foodapp/shared/components/components.dart';
import 'package:foodapp/shared/network/remot/local/cache_helper.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
import 'package:foodapp/view/supliers/editsupplier.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class map_screen extends StatelessWidget {
  final PopupController _popupController = PopupController();
  TextEditingController searchController = TextEditingController();


  int pointIndex = 0;
  MapController mapController = MapController();
  double? lastpositionlatitude;
  double? lastpositionlongitude;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubic = AppCubic.get(context);
          cubic.getCurrentLocation();
          return Scaffold(

              floatingActionButton:

              FloatingActionButton(
                  child: Icon(Icons.radio_button_on),
                  onPressed: () {
                    cubic.listmarkers(cubic.myLocation!.latitude,cubic.myLocation!.longitude,true);
                  }
              ),
              body:Stack(children: [
                FlutterMap(
                  options: MapOptions(controller: mapController,
                    center: cubic.myLocation,
                    zoom: 10,onPositionChanged: (position, hasGesture) {
                      lastpositionlongitude =  position.center!.longitude ;
                      lastpositionlatitude =  position.center!.latitude ;
                      var zomm= position.zoom;
                      cubic.listmarkers(lastpositionlatitude,lastpositionlongitude,true);
                      cubic.savelastpostion(lastpositionlatitude,lastpositionlongitude);
                      print('--------------------------${lastpositionlongitude}********${lastpositionlatitude}---------------');
                      CacheHelper.saveData(key: 'lat', value: lastpositionlatitude);
                      CacheHelper.saveData(key: 'long', value: lastpositionlongitude);
                    },
                    plugins: [
                      MarkerClusterPlugin(),
                    ],
                    onTap: (tapPosition, point) => _popupController.hideAllPopups(),
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayerOptions(markers: cubic.markers, ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Align(alignment: AlignmentDirectional.bottomCenter,
                    child: defaultButton(shape: false,width: 150,
                        function: () {
print('Done lat ${cubic.longitude}');
print('Done lat ${cubic.latitude}');
print('--------------------------${cubic.latitude}======********${cubic.longitude}---------------');

cubic.saveEditeUser();
                        },
                        text: 'Done',
                        isUpperCase: false),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:40,left: 8.0),
                  child: Align(alignment: AlignmentDirectional.topStart,
                    child: InkWell(child: Container(height: 50,width: 50,child: Icon(Icons.arrow_back),decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: new BorderRadius.circular(20)),),onTap: (){

                      Navigator.pushReplacementNamed(
                          context, Routes.editcustomer_screen);
                    },),
                  ),
                ),


              ],)

          );
        });
  }
}
