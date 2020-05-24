import 'package:redux/redux.dart';
import 'package:artenschatuz_am_gebaeude/actions/actions.dart';

final bottomNavigationBarReducer = TypedReducer<int, SelectNavigationBarIndex>(_bottomNavigationBarReducer);

int _bottomNavigationBarReducer(int index, SelectNavigationBarIndex action) {
  return action.index;
}