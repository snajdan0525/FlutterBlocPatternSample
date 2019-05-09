import 'package:flutter/material.dart';
import 'blocs/dog_bloc.dart';
import 'drawer.dart';
import 'models/dog_model.dart';

class SecondPage extends StatefulWidget {
  static String tag = 'second-page';

  final String title = 'Second Page';

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();

    dogBloc.fetchDog();
  }

  @override
  void dispose() {
    ///I cannot do this because it will be use by another page
    //dogBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: MainDrawer(),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  stream: dogBloc.dog,
                  builder: (context, AsyncSnapshot<Dog> snapshot) {
                    if (snapshot.hasData) {
                      print('Fms snapshot');
                      return Image.network(snapshot.data.message);
                    } else if (snapshot.hasError) {
                      return Text('Dog snapshot error!');
                    }
                    return Text('Loading dog..');
                  })
            ],
          ),
        ));
  }
}
