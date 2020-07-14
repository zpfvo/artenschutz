import 'package:flutter/material.dart'
    show
        Widget,
        StatefulWidget,
        State,
        BuildContext,
        MaterialApp,
        Key,
        TextStyle,
        FontWeight,
        Text,
        Center,
        Scaffold,
        AppBar;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_redux/flutter_redux.dart'
    show StoreProvider, StoreConnector;
import 'package:artenschatuz_am_gebaeude/reducers/app_reducer.dart'
    show appReducer;
import 'package:redux_logging/redux_logging.dart' show LoggingMiddleware;
import 'package:artenschatuz_am_gebaeude/models/models.dart' show AppState;
import 'package:artenschatuz_am_gebaeude/navigation_bar.dart' show AppNavBar;
import 'package:artenschatuz_am_gebaeude/locations.dart' show Locations;

class ArtenschutzApp extends StatefulWidget {
  const ArtenschutzApp({
    Key key,
  }) : super(key: key);

  @override
  _ArtenschutzAppState createState() => _ArtenschutzAppState();
}

/// This Widget is the main application widget.
class _ArtenschutzAppState extends State<ArtenschutzApp> {
  static const String _title = 'Artenschutz am Gebäude';

  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = Store<AppState>(appReducer,
        initialState: AppState.init(),
        middleware: [new LoggingMiddleware.printer()]);
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store, child: MaterialApp(title: _title, home: AppScaffold()));
  }
}

class AppScaffold extends StatefulWidget {
  AppScaffold({Key key}) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Artenschutz am Gebäude'),
        ),
        body: Locations(),
        bottomNavigationBar: AppNavBar());
  }
}
