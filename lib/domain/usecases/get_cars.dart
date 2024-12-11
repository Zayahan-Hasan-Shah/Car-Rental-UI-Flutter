import 'package:car_rental_flutter/data/models/cars.dart';
import 'package:car_rental_flutter/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Cars>> call() async {
    return await repository.fetchCars();
  }
}
