import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, StatelessWidget, ListView, ListTile, Text;
import 'package:meta/meta.dart' show required;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:artenschatuz_am_gebaeude/models/models.dart' show AppState;

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        return ListView(
          children: vm.locations.map((e) => ListTile(title: Text(e))).toList(),
        );
      },
    );
  }
}

class _ViewModel {
  final List<String> locations;

  _ViewModel({@required this.locations});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(locations: store.state.locations);
  }
}
