import 'package:car_rental_flutter/data/datasources/firebase_car_datasource.dart';
import 'package:car_rental_flutter/data/models/cars.dart';
import 'package:car_rental_flutter/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDatasource dataSource;
  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Cars>> fetchCars() {
    return dataSource.getCars();
  }
}
