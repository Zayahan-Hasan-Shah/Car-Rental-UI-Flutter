import 'package:car_rental_flutter/data/datasources/firebase_car_datasource.dart';
import 'package:car_rental_flutter/data/repositories/car_repository_impl.dart';
import 'package:car_rental_flutter/domain/repositories/car_repository.dart';
import 'package:car_rental_flutter/domain/usecases/get_cars.dart';
import 'package:car_rental_flutter/presentation/bloc/bloc/cars_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance();

void initInstance() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDatasource>(
        () => FirebaseCarDatasource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(getIt<FirebaseCarDatasource>()));
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));
    getIt.registerFactory(() => CarsBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw e;
  }
}
