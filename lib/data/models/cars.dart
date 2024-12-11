class Cars {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Cars({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Cars.fromMap(Map<String, dynamic> map) {
    return Cars(
      model: map['model'],
      distance: map['distance'],
      fuelCapacity: map['fuelCapacity'],
      pricePerHour: map['pricePerHour'],
    );
  }
}
