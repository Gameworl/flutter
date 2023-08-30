// variable
import 'package:my_app/dart/vehicle.model.dart';

var v1 = "1";

Bicycle bike = Bicycle("sdsd", "sds");
Bicycle? bike2;

//function
bool myFunction(String myParam) {
  return true;
}
bool myFunctionArrow(String myParam) => true;

//collection
List<String> list = ['x', 'y'];
//set
Set<String> set = {'x', 'y'};
//map
Map<String, int> map = {
  'x': 0,
  'y': 1,
};

//record
var rec = ('first', a: 2, b: true, 'last');
void doNothing(rec) => rec.$1; // =>first
void doNothing2(rec) => rec.$2; //ATTENTION => last
void doNothing3(rec) => rec.a; // =>2

(int, int) swap() {
  var (a, b) = (0, 2);
  print(b);
  return (b, a);
}

//enum
enum Color { red, green, blue }