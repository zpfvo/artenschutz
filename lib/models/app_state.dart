import 'package:meta/meta.dart';

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
}