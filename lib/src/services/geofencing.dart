import 'package:flutter/material.dart';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:geo_attendance_system/src/models/office.dart';

// ignore: must_be_immutable
class GeoFencing extends InheritedWidget {
  var service;

  GeoFencing({
    Key? key, // add key parameter
    required Widget child,
    required this.service,
  }) : super(key: key, child: child);

  static GeoFencing of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GeoFencing>()!;
  }

  @override
  bool updateShouldNotify(covariant GeoFencing oldWidget) {
    return oldWidget.service != service;
  }

  // rest of the class implementation
}

late final GeoFencingService service;

@override
bool updateShouldNotify(InheritedWidget old) => true;

GeoFencing of(BuildContext context) {
  final GeoFencing? result =
      context.dependOnInheritedWidgetOfExactType<GeoFencing>();
  assert(result != null, 'No GeoFencingService found in context');
  return result!;
}

class GeoFencingService with ChangeNotifier {
  GeofenceStatus geofenceStatus = GeofenceStatus.init;

  void startGeofencing(Office office) {
    EasyGeofencing.stopGeofenceService();

    EasyGeofencing.startGeofenceService(
      pointedLatitude: office.latitude.toString(),
      pointedLongitude: office.longitude.toString(),
      radiusMeter: office.radius.toString(),
      eventPeriodInSeconds: 5,
    );

    EasyGeofencing.getGeofenceStream()!.listen((GeofenceStatus status) {
      geofenceStatus = status;
      notifyListeners();
    });
  }
}
