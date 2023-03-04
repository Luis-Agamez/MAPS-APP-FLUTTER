import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpas_app_bloc/blocs/blocs.dart';
import 'package:mpas_app_bloc/ui/custom_snackbar.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({Key? key}) : super(key: key);

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
              mapBloc.add(OnToggleUserRoute());
            },
            icon: const Icon(Icons.more_horiz_rounded, color: Colors.black),
          )),
    );
  }
}
