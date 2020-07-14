import 'package:artenschatuz_am_gebaeude/models/location.dart' show Location;
import 'package:redux/redux.dart';
import 'package:artenschatuz_am_gebaeude/actions/actions.dart'
    show SelectNavigationBarIndex;

final locationsReducer = combineReducers<List<Location>>(
    [TypedReducer<List<Location>, SelectNavigationBarIndex>(_addLocation)]);

List<Location> _addLocation(
    List<Location> locations, SelectNavigationBarIndex action) {
  return List.from(locations)
    ..add(Location(
        street: 'Straße',
        houseNumber: action.index.toString(),
        postalCode: '12051',
        city: 'Berlin'));
}
