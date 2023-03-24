import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:geo_attendance_system/src/models/office.dart';

class OfficeDatabase {
  // ignore: deprecated_member_use
  final _databaseReference = FirebaseDatabase.instance.reference();
  static final OfficeDatabase _instance = OfficeDatabase._internal();

  factory OfficeDatabase() {
    return _instance;
  }

  OfficeDatabase._internal();

  Future<Office> getOfficeBasedOnUID(String uid) async {
    DataSnapshot dataSnapshot =
        (await _databaseReference.child("users").once()).snapshot;
    final userInfo = (dataSnapshot.value as Map)[uid];
    final office = userInfo["allotted_office"];
    print(userInfo);

    dataSnapshot = (await _databaseReference.child("location").once()).snapshot;
    print("++++++++++++++++++++++");
    print(dataSnapshot);
    print("++++++++++++++++++++++");
    final findOffice = (dataSnapshot.value as Map)[office];
    final name = findOffice != null ? findOffice["name"] : null;
    final latitude = findOffice != null ? findOffice["latitude"] : null;
    final longitude = findOffice != null ? findOffice["longitude"] : null;
    final radius = findOffice != null
        ? (findOffice["radius"] ?? 20000).toDouble()
        : 20000.0;

    return Office(
        key: office,
        name: name,
        latitude: latitude,
        longitude: longitude,
        radius: radius);
  }

  Future<List<Office>> getOfficeList() async {
    DataSnapshot dataSnapshot = (await _databaseReference.once()).snapshot;
    final officeList = (dataSnapshot.value as Map)["location"];
    List<Office> result = [];

    var officeMap = officeList;
    officeMap.forEach((key, map) {
      result.add(Office.fromJson(key, map.cast<String, dynamic>()));
    });

    return result;
  }
}
