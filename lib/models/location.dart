import 'package:meta/meta.dart' show immutable, required;

@immutable
class Location {
  final String street;
  final String houseNumber;
  final String postalCode;
  final String city;

  const Location(
      {@required this.street,
      @required this.houseNumber,
      @required this.postalCode,
      @required this.city});

  @override
  String toString() {
    return '$street $houseNumber, $postalCode $city';
  }
}
