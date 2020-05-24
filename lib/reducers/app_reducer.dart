import 'package:artenschatuz_am_gebaeude/models/models.dart';
import 'package:artenschatuz_am_gebaeude/reducers/bottomNavigationBarReducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    bottomNavigationBarSelectedIndex: bottomNavigationBarReducer(state.bottomNavigationBarSelectedIndex, action));
}