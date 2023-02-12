import 'package:bloc_trial/bloc/cubit/counter_cubit.dart';
import 'package:bloc_trial/bloc/cubit/counter_cubit.dart';
import 'package:bloc_trial/bloc/cubit/counter_state.dart';
import 'package:bloc_trial/bloc/cubit/internet_cubit.dart';
import 'package:bloc_trial/router/app_router.dart';
import 'package:bloc_trial/screens/home_screeen.dart';
import 'package:bloc_trial/screens/second_screen.dart';
import 'package:bloc_trial/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter, required this.connectivity});
  // final CounterCubit _counterCubit = CounterCubit();
  final AppRouter appRouter;
  final Connectivity connectivity;

//   @override
//   void dispose(){
//     _appRouter.dispose();
//     // _counterCubit.close();
//     super.dispose();
// }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(
          connectivity: connectivity,),
          // connectivityStreamSubscription),
    ),
      BlocProvider(
          create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>()),
              // internetStreamSubscription),
              // internetStreamSubscription)
      ),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //     value: _counterCubit,
        //     child: const HomeScreen(title: 'HomeScreen',
        //         colors: Colors.cyanAccent),
        //   ),
        //   '/second': (context) => BlocProvider.value(
        //     value: _counterCubit,
        //     child: const SecondScreen(title: 'Second Screen',
        //         colors: Colors.cyan),
        //   ),
        //   '/third': (context) => BlocProvider.value(
        //     value: _counterCubit,
        //     child: const ThirdScreen(title: 'Third Screen',
        //         colors: Colors.lightBlueAccent),
        //   ),
        // },
        // home: BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(),
        //   child: const HomeScreen(title: 'Flutter Demo Home Page',
        //     colors: Colors.cyan,
        //   ),
        // ),
        )
      );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   // void _incrementCounter() {
//   //   setState(() {
//   //     // This call to setState tells the Flutter framework that something has
//   //     // changed in this State, which causes it to rerun the build method below
//   //     // so that the display can reflect the updated values. If we changed
//   //     // _counter without calling setState(), then the build method would not be
//   //     // called again, and so nothing would appear to happen.
//   //     _counter++;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         body: Center(
//           child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             BlocConsumer<CounterCubit, CounterState>(
//                 builder: (context, state) {
//                   if (state.counterValue < 0) {
//                     return Text(
//                       "Negative ${state.counterValue}",
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else if (state.counterValue > 0) {
//                     return Text(
//                       "Positive ${state.counterValue}",
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   }
//                   return Text(
//                     "Nothing but ${state.counterValue}",
//                     style: Theme.of(context).textTheme.headline4,
//                   );
//                 },
//               listener: (context, state) {
//                 if (state.wasIncremented == true) {
//                   Fluttertoast.showToast(
//                     msg: 'Incremented to ${state.counterValue}',
//                     toastLength: Toast.LENGTH_LONG,
//                     gravity: ToastGravity.CENTER,
//                     backgroundColor: Colors.black12,
//                     textColor: Colors.white,
//                   );
//                 }
//                 else{
//                   Fluttertoast.showToast(
//                     msg: 'Decremented to ${state.counterValue}',
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.CENTER,
//                     backgroundColor: Colors.black12,
//                     textColor: Colors.white,
//                   );
//                 }
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   onPressed: () {
//                     BlocProvider.of<CounterCubit>(context).increment();
//                   },
//                   tooltip: 'Increment',
//                   child: const Icon(Icons.add),
//                 ),
//                 FloatingActionButton(
//                   onPressed: () {
//                     BlocProvider.of<CounterCubit>(context).decrement();
//                   },
//                   tooltip: 'Decrement',
//                   child: const Icon(Icons.remove),
//                 ),
//               ],
//             ),
//           ],
//           )
//     ));
//       // This trailing comma makes auto-formatting nicer for build methods.
//   }
// }
