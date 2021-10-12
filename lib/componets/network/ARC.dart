import 'package:ambulancesailorpath/componets/modals/Token.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

Dio dio = Dio(BaseOptions(
    baseUrl: 'https://morning-journey-99210.herokuapp.com',
    connectTimeout: 60000,
    sendTimeout: 60000));

void myToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.black,
      fontSize: 16.0);
}

double? latitude = -1, longitude = -1;

void registerdevice() async {
  // location
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {}
  }
  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  print(1);
  _locationData = await location.getLocation();
  print(1);
  Token tokens = Token();
  print(1);
  tokens.token = await FirebaseMessaging.instance.getToken();
  tokens.latitude = _locationData.latitude;
  tokens.longitude = _locationData.longitude;
  latitude = tokens.latitude;
  longitude = tokens.longitude;
  print(1);
  dio.post('/register', data: tokens).then((value) {
    myToast("Registered");
    print(1);
  }).catchError((err) {
    print(2);
    myToast("Already register");
  });
}

void unregisterdevice() async {
  if (latitude == -1 || longitude == -1) {
    myToast("Not registered");
    return;
  }

  // location

  Token tokens = Token();
  tokens.token = await FirebaseMessaging.instance.getToken();
  tokens.latitude = latitude;
  tokens.longitude = longitude;
  dio.delete('/register', data: tokens).then((value) {
    myToast("Success fully unregidtered");
    latitude = -1;
    longitude = -1;
  }).catchError((err) {
    myToast('Not Registered');
    latitude = -1;
    longitude = -1;
  });
}
