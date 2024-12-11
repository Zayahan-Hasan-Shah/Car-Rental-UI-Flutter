import 'package:car_rental_flutter/data/models/cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDatasource {
  final FirebaseFirestore firestore;
  FirebaseCarDatasource({required this.firestore});
  Future<List<Cars>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Cars.fromMap(doc.data())).toList();
  }
}
