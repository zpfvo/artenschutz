import 'package:meta/meta.dart' show immutable, required;
import 'package:artenschatuz_am_gebaeude/models/location.dart' show Location;

@immutable
class AppState {
  final int bottomNavigationBarSelectedIndex;
  final List<Location> locations;

  const AppState(
      {@required this.bottomNavigationBarSelectedIndex,
      @required this.locations});

  @override
  String toString() {
    return '''AppState: {
    bottomNavigationBarSelectedIndex: $bottomNavigationBarSelectedIndex,
    locations: ${locations.join(", ")}
          }''';
  }

  static AppState init() =>
      AppState(bottomNavigationBarSelectedIndex: 0, locations: [
        Location(
            street: 'Kastanienallee',
            houseNumber: '84',
            postalCode: '10435',
            city: 'Berlin')
      ]);
}
