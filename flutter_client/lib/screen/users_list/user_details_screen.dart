import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_client/bloc/get_users/get_users_bloc.dart';
import 'package:flutter_client/bloc/get_users/get_users_state.dart';

class UserDetailsScreen extends StatelessWidget {
  final int index;

  const UserDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: Center(
          child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: BlocBuilder<GetUsersBloc, GetUsersState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Icon(
                          Icons.face,
                          size: 60,
                          color: Colors.black,
                        ),
                        Text(state.result[index].firstName),
                        Text(state.result[index].lastName)
                      ],
                    );
                  },
                ),
              )),
        ));
  }
}
