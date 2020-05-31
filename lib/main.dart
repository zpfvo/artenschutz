import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:artenschatuz_am_gebaeude/models/models.dart';
import 'package:artenschatuz_am_gebaeude/reducers/app_reducer.dart';
import 'package:artenschatuz_am_gebaeude/actions/actions.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(bottomNavigationBarSelectedIndex: 0),
    middleware: [new LoggingMiddleware.printer()]
  );
  runApp(StoreProvider(store: store, child: MyApp()));
} 


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Artenschutz am Gebäude';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
