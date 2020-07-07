import 'package:meta/meta.dart' show immutable, required;

@immutable
class AppState {
  final int bottomNavigationBarSelectedIndex;
  final List<String> locations;

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
      AppState(bottomNavigationBarSelectedIndex: 0, locations: []);
}
