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
                color: Colors.grey.shade500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: BlocBuilder<GetUsersBloc, GetUsersState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.face,
                          size: MediaQuery.of(context).size.height * 0.1,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Name: ${state.result[index].firstName} ${state.result[index].lastName}',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Age: ${state.result[index].age}',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'ID: ${state.result[index].id}',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),
        ));
  }
}
