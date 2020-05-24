import 'package:meta/meta.dart';

@immutable
class AppState {
  final int bottomNavigationBarSelectedIndex;

  const AppState({
    @required this.bottomNavigationBarSelectedIndex,
  });
}