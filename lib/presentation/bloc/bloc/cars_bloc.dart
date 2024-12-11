import 'package:bloc/bloc.dart';
import 'package:car_rental_flutter/data/models/cars.dart';
import 'package:car_rental_flutter/domain/usecases/get_cars.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  // CarsBloc() : super(CarsInitial()) {
  //   on<CarsEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }

  final GetCars getCars;

  CarsBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
