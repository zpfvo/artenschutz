import 'package:flutter/material.dart' show
  Widget, StatefulWidget, State, 
  BuildContext, MaterialApp, Key,
  TextStyle, FontWeight, Text, Center, Icons, Icon, Colors,
  Scaffold, AppBar, BottomNavigationBar, BottomNavigationBarItem;
import 'package:redux/redux.dart' show Store;
import 'package:flutter_redux/flutter_redux.dart' show StoreProvider, StoreConnector;
import 'package:artenschatuz_am_gebaeude/reducers/app_reducer.dart' show appReducer;
import 'package:redux_logging/redux_logging.dart' show LoggingMiddleware;

import 'package:artenschatuz_am_gebaeude/actions/actions.dart' show SelectNavigationBarIndex;
import 'package:artenschatuz_am_gebaeude/models/models.dart' show AppState;

import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

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
    store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [new LoggingMiddleware.printer()]
  );
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: _title,
        home: AppScaffold()
      )
    );
  }
}

class AppScaffold extends StatefulWidget {
  AppScaffold({Key key}) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Standorte',
      style: optionStyle,
    ),
    Text(
      'Beobachtung',
      style: optionStyle,
    ),
    Text(
      'Archiv',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artenschutz am Gebäude'),
      ),
      body: StoreConnector<AppState, int>(
        converter: (Store<AppState> store) => store.state.bottomNavigationBarSelectedIndex,
        builder: (BuildContext context, int bottomNavigationBarSelectedIndex) {
          return Center(
            child: _widgetOptions.elementAt(bottomNavigationBarSelectedIndex)
            );
        }
        ),
      bottomNavigationBar: StoreConnector<AppState, int>(
        converter: (Store<AppState> store) => store.state.bottomNavigationBarSelectedIndex,
        builder: (BuildContext context, int bottomNavigationBarSelectedIndex) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.mapMarkedAlt),
                title: Text('Standorte'),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.binoculars),
                title: Text('Beobachtung'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text('Archiv'),
              ),
            ],
            currentIndex: bottomNavigationBarSelectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) => StoreProvider.of<AppState>(context)
                        .dispatch(SelectNavigationBarIndex(index)),
          );
        }
      ),
    );
  }
}
