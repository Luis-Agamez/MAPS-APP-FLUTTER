import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpas_app_bloc/blocs/blocs.dart';
import 'package:mpas_app_bloc/screens/screens.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          print('status All : ${state.isAllGranted} ');
          return state.isAllGranted
              ? const MapsScreen()
              : const GpsAccesScreen();
        },
      ),
    );
  }
}
