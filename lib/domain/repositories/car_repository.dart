import 'package:car_rental_flutter/data/models/cars.dart';

abstract class CarRepository {
  Future<List<Cars>> fetchCars();
}