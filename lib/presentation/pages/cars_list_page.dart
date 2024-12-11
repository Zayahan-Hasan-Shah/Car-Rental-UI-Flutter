import 'package:car_rental_flutter/presentation/bloc/bloc/cars_bloc.dart';
import 'package:car_rental_flutter/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsListPage extends StatelessWidget {
  // final List<Cars> cars = [
  //   Cars(
  //       model: 'Fortuner GT',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  //   Cars(
  //       model: 'Fortuner GT',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  //   Cars(
  //       model: 'Fortuner GT',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  //   Cars(
  //       model: 'Fortuner GT',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  //   Cars(
  //       model: 'Fortuner GT',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 45),
  // ];

  CarsListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select your car"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarsBloc, CarsState>(builder: (context, state) {
        if (state is CarsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CarsLoaded) {
          return state.cars.length == 0
              ? Center(
                  child: Text("No cars Available for rent!"),
                )
              : ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    return CarCard(
                      cars: state.cars[index],
                    );
                  });
        } else if (state is CarsError) {
          return Center(
            child: Text('Error ${state.message}'),
          );
        }
        return Container();
      }),
    );
  }
}
