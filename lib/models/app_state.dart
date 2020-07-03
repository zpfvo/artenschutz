import 'package:meta/meta.dart' show immutable, required;

@immutable
class AppState {
  final int bottomNavigationBarSelectedIndex;

  const AppState({
    @required this.bottomNavigationBarSelectedIndex,
  });

  @override
  String toString() {
    return 'AppState: {bottomNavigationBarSelectedIndex: $bottomNavigationBarSelectedIndex}';
  }

  static AppState init() => AppState(bottomNavigationBarSelectedIndex: 0);
}