import 'package:artenschatuz_am_gebaeude/models/models.dart' show AppState;
import 'package:artenschatuz_am_gebaeude/reducers/bottom_navigation_bar_reducer.dart';
import 'package:artenschatuz_am_gebaeude/reducers/locations_reducer.dart'
    show locationsReducer;

AppState appReducer(AppState state, action) {
  return AppState(
      bottomNavigationBarSelectedIndex: bottomNavigationBarReducer(
          state.bottomNavigationBarSelectedIndex, action),
      locations: locationsReducer(state.locations, action));
}
