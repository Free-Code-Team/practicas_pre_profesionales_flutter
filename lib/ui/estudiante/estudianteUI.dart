import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicas_pre_profesionales_flutter/bloc/auth/auth_bloc.dart';
import 'package:practicas_pre_profesionales_flutter/ui/admin/drawer_admin.dart';
import 'package:flutter/material.dart';
import 'package:practicas_pre_profesionales_flutter/ui/auth/sign_in.dart';
import 'package:practicas_pre_profesionales_flutter/ui/estudiante/drawer_estudiante.dart';

class EstudianteUI extends StatelessWidget {
  const EstudianteUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is DesautenticadoState) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignIn()),
                  (route) => false,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Estudiante'),
            centerTitle: true,
            backgroundColor: Colors.blue[900],
          ),
          drawer: const DrawerEstudiante(),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue[900],
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.account_circle),
                    color: Colors.white,
                    onPressed: () {}),
                const Spacer(),
                IconButton(
                    icon: const Icon(Icons.logout),
                    color: Colors.white,
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context)
                          .add(DesautenticarEvent());
                    }),
              ],
            ),
          ),
          body: const Center(
            child: Text('Estudiante'),
          ),
        ));
  }
}