import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        CircleAvatar,
        Icon,
        ListTile,
        ListView,
        StatelessWidget,
        Text,
        Widget;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;
import 'package:meta/meta.dart' show required;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;
import 'package:artenschatuz_am_gebaeude/models/models.dart' show AppState;

import 'models/location.dart' show Location;

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        return ListView(
          children: vm.locations
              .map((e) => ListTile(
                    leading: CircleAvatar(
                        child: Icon(FontAwesomeIcons.mapMarkedAlt)),
                    title: Text('${e.street} ${e.houseNumber}'),
                    subtitle: Text('${e.postalCode} ${e.city}'),
                  ))
              .toList(),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Location> locations;

  _ViewModel({@required this.locations});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(locations: store.state.locations);
  }
}
