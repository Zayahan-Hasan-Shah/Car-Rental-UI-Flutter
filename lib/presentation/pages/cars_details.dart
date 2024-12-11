import 'package:car_rental_flutter/data/models/cars.dart';
import 'package:car_rental_flutter/presentation/pages/maps_details_page.dart';
import 'package:car_rental_flutter/presentation/widgets/car_card.dart';
import 'package:car_rental_flutter/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarsDetails extends StatefulWidget {
  final Cars cars;
  const CarsDetails({super.key, required this.cars});

  @override
  State<CarsDetails> createState() => _CarsDetailsState();
}

class _CarsDetailsState extends State<CarsDetails>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _animation = Tween<double>(begin: 1.00, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
            ),
            Text(
              'Information',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            cars: Cars(
                model: widget.cars.model,
                distance: widget.cars.distance,
                fuelCapacity: widget.cars.fuelCapacity,
                pricePerHour: widget.cars.pricePerHour),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 2,
                          spreadRadius: 0.45,
                        )
                      ],
                    ),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Jane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,250',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsDetailsPage(
                            cars: widget.cars,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 1,
                            spreadRadius: 0.45,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/maps.png',
                            fit: BoxFit.cover,
                          ),
                          
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                MoreCard(
                  cars: Cars(
                      model: "${widget.cars.model}-1",
                      distance: widget.cars.distance + 100,
                      fuelCapacity: widget.cars.fuelCapacity + 100,
                      pricePerHour: widget.cars.pricePerHour + 10),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  cars: Cars(
                      model: "${widget.cars.model}-2",
                      distance: widget.cars.distance + 200,
                      fuelCapacity: widget.cars.fuelCapacity + 200,
                      pricePerHour: widget.cars.pricePerHour + 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  cars: Cars(
                      model: "${widget.cars.model}-3",
                      distance: widget.cars.distance + 300,
                      fuelCapacity: widget.cars.fuelCapacity + 300,
                      pricePerHour: widget.cars.pricePerHour + 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
