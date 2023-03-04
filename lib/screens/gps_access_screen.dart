import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpas_app_bloc/blocs/gps/gps_bloc.dart';

class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
          return !state.isGpsEnabled
              ? const _EnabledGpsMessage()
              : const _AccessButton();
        }),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Es necesario el Acceso al Gps'),
        MaterialButton(
            elevation: 0,
            splashColor: Colors.transparent,
            color: Colors.black,
            shape: const StadiumBorder(),
            child: const Text('Solicitar Acceso',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();
            })
      ],
    );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe habilitar su gps',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
