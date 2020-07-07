import 'package:redux/redux.dart';
import 'package:artenschatuz_am_gebaeude/actions/actions.dart'
    show SelectNavigationBarIndex;

final locationsReducer = combineReducers<List<String>>(
    [TypedReducer<List<String>, SelectNavigationBarIndex>(_addLocation)]);

List<String> _addLocation(
    List<String> locations, SelectNavigationBarIndex action) {
  return List.from(locations)..add(action.index.toString());
}
