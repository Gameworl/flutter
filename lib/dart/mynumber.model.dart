class MyNumber {
  late int x, y;
  MyNumber(this.x, this.y);

//see also https://pub.dev/packages/json_serializable
  MyNumber.fromJson(Map<String, dynamic> sessionMap) {
    x = sessionMap['x'] ?? 0;
    y = sessionMap['y'] ?? 0;
  }
  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
    };
  }

//getter
  int get total => x + y;

  MyNumber operator +(MyNumber v) => MyNumber(x + v.x, y + v.y);
}
