import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpas_app_bloc/blocs/blocs.dart';
import 'package:mpas_app_bloc/ui/custom_snackbar.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 25,
          child: IconButton(
            onPressed: () {
              final userLocation = locationBloc.state.lastKnownLocation;

              if (userLocation == null) {
                final snack = CustomSnackbar(message: 'Location not found');
                ScaffoldMessenger.of(context).showSnackBar(snack);
                return;
              }
              //Snack
              mapBloc.moveCamera(userLocation);
            },
            icon: const Icon(
              Icons.my_location_outlined,
              color: Colors.black,
            ),
          )),
    );
  }
}
