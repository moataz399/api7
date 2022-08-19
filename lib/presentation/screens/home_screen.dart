import 'package:api/business_logic/result_state.dart';
import 'package:api/models/users.dart';
import 'package:api/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/user_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Users> userList = [];

  Users user = Users();

  @override
  void initState() {
    // BlocProvider.of<UserCubit>(context).getUserDetails(3599);
    //
    // BlocProvider.of<UserCubit>(context).getAllUsers();

    // BlocProvider.of<UserCubit>(context).deleteUser(2775);

    BlocProvider.of<UserCubit>(context).createNewUser(Users(
        name: 'moataz',
        email: 'moataz141@gmail.com',
        gender: 'male',
        status: 'active'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen'),
      ),
      body: Column(
        children: [
          // BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          //   if (state is CreateNewUser ) {
          //     user = state.newUser;
          //
          //     return ListView.builder(
          //         shrinkWrap: true,
          //         padding:const  EdgeInsets.all(8),
          //         itemCount: userList.length,
          //         itemBuilder: (BuildContext context, index) {
          //           return Container(
          //             height: 50,
          //             color: Colors.red,
          //             child: Text(userList[index].name!.toString()),
          //           );
          //         });
          //   } else {
          //     return const  Center(child: CircularProgressIndicator());
          //   }
          //
          //
          // }),
          // Divider(height: 100),
          BlocBuilder<UserCubit, ResultState<Users>>(
              builder: (context, ResultState<Users> state) {
                return state.when(idle: () {
                  return Center(child: CircularProgressIndicator());
                }, loading: () {
                  return Center(child: CircularProgressIndicator());
                }, success: (dynamic userData) {
                  return Container(
                    height: 50,
                    color: Colors.red,
                    child: Text(userData.name),
                  );
                }, error: (NetworkExceptions error) {
                  return Center(
                    child: Text(NetworkExceptions.getErrorMessage(error)),);
                })

                ;
                // user = state.newUser;
                // return Container(
                // height: 50,
                // color: Colors.red,
                // child: Text(state.data.toString()),
                // );
                // } else {
                // return Center(child: CircularProgressIndicator());
                // }
              })
        ],
      ),
    );
  }
}
