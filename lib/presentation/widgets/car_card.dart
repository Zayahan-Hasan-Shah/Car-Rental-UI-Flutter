import 'package:car_rental_flutter/data/models/cars.dart';
import 'package:car_rental_flutter/presentation/pages/cars_details.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Cars cars;
  const CarCard({
    super.key,
    required this.cars,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CarsDetails(cars: cars)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 4,
              spreadRadius: 0.45,
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/car_image.png',
              height: 120,
            ),
            Text(
              cars.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/gps.png',
                    ),
                    Text(
                      "${cars.distance.toStringAsFixed(0)}km",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      'assets/pump.png',
                    ),
                    Text(
                      "${cars.fuelCapacity.toStringAsFixed(0)}L",
                    ),
                  ],
                ),
                Text(
                  '${cars.pricePerHour.toStringAsFixed(2)}/h',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
