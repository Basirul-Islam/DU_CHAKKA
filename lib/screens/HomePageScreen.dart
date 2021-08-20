import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'NavDrawer.dart';
import 'BusSearch.dart';
import '../User.dart';
import 'package:geolocator/geolocator.dart';


class HomePage extends StatefulWidget {
  static const String id = 'homepage_screen';

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<HomePage>{
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUSer;

  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    getCurrentUSer();
  }
  void getCurrentUSer() async{
    try{
      final user = await _auth.currentUser();
      if(user!= null){
        loggedInUSer = user;
        User.uid = loggedInUSer.uid;
        print("\nemail: " + loggedInUSer.email + "\nUID: " + loggedInUSer.uid);

        //await DatabseService(uid: loggedInUSer.uid).updateUserData(User.userName, User.userRegNo, User.userRegNo);
        //signOut();
      }
      //getCurrentUSer();
      setState(() {
        isLoading = false;
      });
    }catch(e){
      print(e);
    }
  }
  void signOut() async {
    print("waiting for sign out");
    await _auth.signOut();
    print('sign out');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search Bus'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: BusSearch());
              },
            )
          ],
/*Text('BUS Tracker'),*/

          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        drawer: NavDrawer(),
        //backgroundColor: Colors.lightGreenAccent[400],
        body: isLoading? Center(
          child: CircularProgressIndicator(),
        ) : Testbdy(loggedInUSer.email),
      ),
    );
  }

}

class Testbdy extends StatefulWidget {

  String email;


  Testbdy(this.email);

  @override
  _TestbdyState createState() => _TestbdyState();
}

class _TestbdyState extends State<Testbdy> {

  String myText = "Test Text";
  double width;
  double height;

  bool isAdmin = false;
  bool CheckIsAdmin(){
    if( widget.email == "duchakka@gmail.com" ){
      isAdmin = true;
    }else{
      isAdmin = false;
    }
  }

  Position currentPosition = new Position(longitude: 0, latitude: 0);

  Future _determinePosition() async {
    CheckIsAdmin();

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    if(isAdmin)
      {
        currentPosition =  await Geolocator.getCurrentPosition();
       // currentPosition = new Position(latitude: 23.8819773, longitude: 90.3946401);
        print(currentPosition.longitude);
        print(currentPosition.latitude);
        _gotoDefault(currentPosition.latitude, currentPosition.longitude);

        Response response;
        Dio dio = new Dio();

        response = await dio.put("https://duchakkav2-default-rtdb.firebaseio.com/loc.json", data: {'lat' : currentPosition.latitude, 'lon': currentPosition.longitude});
        print(response.data.toString());
      }

    else
      {
        Response response;
        Dio dio = new Dio();

        response = await dio.get("https://duchakkav2-default-rtdb.firebaseio.com/loc.json");

        if(response!=null)
          {
            var data = response.data;
            print(data);

            double lat = data['lat'];
            double lon = data['lon'];

            currentPosition =  new Position(latitude: lat, longitude: lon);
            print(currentPosition.longitude);
            print(currentPosition.latitude);
            _gotoDefault(currentPosition.latitude, currentPosition.longitude);

          }


      }



  }



  final controller = MapController(
    location: LatLng(0,0),
  );

  void _gotoDefault(double lat, double lon) {
    controller.center = LatLng(lat, lon);
    setState(() {});
  }

  void _onDoubleTap() {
    controller.zoom += 0.5;
    setState(() {});
  }

  Offset _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color) {
    return Positioned(
      left: pos.dx - 16,
      top: pos.dy - 16,
      width: 65,
      height: 65,
      child: Icon(Icons.directions_bus, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _determinePosition,
        tooltip: 'My Location',
        child: Icon(Icons.my_location),
      ),
      body: SafeArea(
          child: Container(
        height: height,
        width: width,
        color: Colors.blue,
        child:  MapLayoutBuilder(
          controller: controller,
          builder: (context, transformer) {

            final centerLocation = Offset(
                transformer.constraints.biggest.width / 2,
                transformer.constraints.biggest.height / 2);

            final centerMarkerWidget =
            _buildMarkerWidget(centerLocation, Colors.red);

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: _onDoubleTap,
              onScaleStart: _onScaleStart,
              onScaleUpdate: _onScaleUpdate,
              onTapUp: (details) {
                final location =
                transformer.fromXYCoordsToLatLng(details.localPosition);

                final clicked = transformer.fromLatLngToXYCoords(location);

                print('${location.longitude}, ${location.latitude}');
                print('${clicked.dx}, ${clicked.dy}');
                print('${details.localPosition.dx}, ${details.localPosition.dy}');
              },
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerSignal: (event) {
                  if (event is PointerScrollEvent) {
                    final delta = event.scrollDelta;

                    controller.zoom -= delta.dy / 1000.0;
                    setState(() {});
                  }
                },
                child: Stack(
                  children: [
                    Map(
                      controller: controller,
                      builder: (context, x, y, z) {
                        //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.

                        //Google Maps
                        final url =
                            'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                        return CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    centerMarkerWidget,
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
