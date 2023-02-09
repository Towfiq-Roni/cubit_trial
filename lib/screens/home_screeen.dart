import 'package:bloc_trial/bloc/cubit/counter_cubit.dart';
import 'package:bloc_trial/bloc/cubit/counter_state.dart';
import 'package:bloc_trial/bloc/cubit/internet_cubit.dart';
import 'package:bloc_trial/bloc/cubit/internet_state.dart';
import 'package:bloc_trial/constants/enums.dart';
import 'package:bloc_trial/screens/second_screen.dart';
import 'package:bloc_trial/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.colors});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Color colors;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        body: Center(
            child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state){
              if (state is InternetConnected &&
              state.connectionType == ConnectionType.Wifi) {
                // emitInternetConnected(ConnectionType.Wifi);
                return const Text('Wifi');
              }
              else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                // emitInternetConnected(ConnectionType.Mobile);
                return const Text('Mobile');
              }
              else if (state is InternetDisconnected) {
                // emitInternetDisconnected();
                return const Text('Disconnected');
              }
              return const CircularProgressIndicator();
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "Negative ${state.counterValue}",
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue > 0) {
                  return Text(
                    "Positive ${state.counterValue}",
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  "Nothing but ${state.counterValue}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Fluttertoast.showToast(
                    msg: 'Incremented to ${state.counterValue}',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.black12,
                    textColor: Colors.white,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: 'Decremented to ${state.counterValue}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.black12,
                    textColor: Colors.white,
                  );
                }
              },
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   // crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     FloatingActionButton(
            //       heroTag: null,
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).increment();
            //       },
            //       tooltip: 'Increment',
            //       child: const Icon(Icons.add),
            //     ),
            //     FloatingActionButton(
            //       heroTag: null,
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).decrement();
            //       },
            //       tooltip: 'Decrement',
            //       child: const Icon(Icons.remove),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/second'
                  );
                },
                child: const Text('Second Screen')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/third'
                  );
                },
                child: const Text('Third Screen')),
          ],
        )));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
