sealed class Vehicle {

   String date;
   String immatriculation ;
  Vehicle({ required this.date,required this.immatriculation});
  
}

class Car extends Vehicle {
  int nbPorte;

  Car( {required String  immatriculation,required  String date,
   required this.nbPorte})
  : super(immatriculation:immatriculation,date:date);

}

class Truck extends Vehicle {
 late bool trailer;

  Truck( {required String  immatriculation,required  String date,bool trailer=false})
  : super(immatriculation:immatriculation,date:date);

}

class Bicycle extends Vehicle {
    late bool isElectric ;

  Bicycle(  immatriculation, date )
  : super(immatriculation:immatriculation,date:date);
}

// ERROR: Cannot be instantiated
//Vehicle myVehicle = Vehicle();

// Subclasses can be instantiated
Vehicle myCar = Car(immatriculation: '5667BG56',date:'22-12-2022',nbPorte:5);
Vehicle mybike = Bicycle('5667BG56','22-12-2022');
String getVehicleSound(Vehicle vehicle) {
  // ERROR: The switch is missing the Bicycle subtype or a default case.
  return switch (vehicle) {
    Car() => 'vroom',
    Truck() => 'VROOOOMM',
    Bicycle() => 'dringdring'
  };
}
