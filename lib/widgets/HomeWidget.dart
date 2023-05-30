import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stepzilla/NavBar.dart';
import 'package:flutter_motion/flutter_motion.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{
  StreamSubscription<Activity>? _pedestrianStatusSubscription;
  StreamSubscription<Motion>? _motionDetectorSubscription;
  bool isRunning = false;
  String? _motionError, _activityError;

  late ValueNotifier<Activity> _activityNotifier;
  late ValueNotifier<Motion> _motionNotifier;

  @override
  void initState() {
    _activityNotifier = ValueNotifier(Activity.unknown);
    _motionNotifier = ValueNotifier(const Motion());
    super.initState();
  }

  void onMotion(Motion event) {
    // print(event);
    _motionNotifier.value = event;
  }

  void onPedestrianStatusChanged(Activity event) {
    // print(event);
    _activityNotifier.value = event;
  }

  void onPedestrianStatusError(error) {
    // print('onPedestrianStatusError: $error');
    setState(() {
      _motionError = error.toString();
    });
    // print(_status);
  }

  void onMotionError(error) {
    setState(() {
      _activityError = error.toString();
    });
  }

  _listenToActivity() {
    _pedestrianStatusSubscription = FlutterMotion.pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
      ..onError(onPedestrianStatusError);
  }

  _listenToMotion() {
    _motionDetectorSubscription = FlutterMotion.motionDetectorStream
        .listen(onMotion)
      ..onError(onMotionError);
  }

  _start() {
    _listenToActivity();
    _listenToMotion();
    setState(() {
      isRunning = true;
    });
  }

  _stop() {
    _pedestrianStatusSubscription?.cancel();
    _motionDetectorSubscription?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        lazy: false,
        create: (context) => _motionNotifier,
        builder: (c, child) => ChangeNotifierProvider(
          lazy: false,
          create: (context) => _activityNotifier,
          builder: (c, child) => MaterialApp(
            home: Scaffold(
              drawer: NavBar(),
              appBar: AppBar(
                title: const Text('Home'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: isRunning ? _stop : _start,
                child: isRunning
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (_activityError != null) Text(_activityError ?? ''),
                  if (_motionError != null) Text(_motionError ?? ''),
                  Builder(builder: (context) {
                    return ListTile(
                      title: Text(
                          'Moonwalking',
                          style: Theme.of(context).textTheme.headline4),
                      subtitle: const Text('Activity'),
                    );
                  }),
                  Builder(builder: (context) {
                    var motion = context.watch<ValueNotifier<Motion>>();
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        ListTile(
                          title: Text(
                              motion.value.averageActivePace
                                  .toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline4),
                          subtitle: const Text('Average Active Pace'),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          title: Text(
                              motion.value.currentPace.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline4),
                          subtitle: const Text('Current Pace'),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          title: Text(
                              motion.value.distance.toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline4),
                          subtitle: const Text('Distance'),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          title: Text(
                              motion.value.floorsAscended
                                  .toStringAsFixed(2),
                              style: Theme.of(context).textTheme.headline4),
                          subtitle: const Text('Floors Ascended'),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          title: Text('${motion.value.numberOfSteps}',
                              style: Theme.of(context).textTheme.headline4),
                          subtitle: const Text('Number of Steps'),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ));

  }
}