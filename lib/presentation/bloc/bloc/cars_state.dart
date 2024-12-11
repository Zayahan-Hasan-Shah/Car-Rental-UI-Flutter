part of 'cars_bloc.dart';

// @immutable
// sealed class CarsState {}

// final class CarsInitial extends CarsState {}

abstract class CarsState {}

class CarsLoading extends CarsState {}

class CarsLoaded extends CarsState {
  final List<Cars> cars;
  CarsLoaded(this.cars);
}

class CarsError extends CarsState {
  final String message;
  CarsError(this.message);
}
