import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, StatelessWidget, ListView;
import 'package:meta/meta.dart' show required;
import 'package:redux/redux.dart' show Store;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:artenschatuz_am_gebaeude/models/models.dart' show AppState;
import 'package:artenschatuz_am_gebaeude/actions/actions.dart'
    show SelectNavigationBarIndex;

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        return ListView();
      },
    );
  }
}

class _ViewModel {
  final int bottomNavigationBarSelectedIndex;
  final Function(int) onTap;

  _ViewModel(
      {@required this.bottomNavigationBarSelectedIndex, @required this.onTap});

  factory _ViewModel.create(Store<AppState> store) {
    _onTap(index) {
      store.dispatch(SelectNavigationBarIndex(index));
    }

    return _ViewModel(
        bottomNavigationBarSelectedIndex:
            store.state.bottomNavigationBarSelectedIndex,
        onTap: _onTap);
  }
}
