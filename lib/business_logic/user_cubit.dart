import 'package:api/business_logic/result_state.dart';
import 'package:bloc/bloc.dart';


import '../data/repository/user_repo.dart';
import '../models/users.dart';
import '../network_exceptions.dart';
class UserCubit extends Cubit<ResultState<Users>> {
  final UserRepo userRepo;

  UserCubit(this.userRepo) : super(const  Idle());



  // void getAllUsers() async{
  //   var data = await userRepo.getUsers();
  //
  //   data.when(success: (List<Users> usersData){
  //     emit(ResultState.success(usersData));
  //   }, failure: (NetworkExceptions networkExceptions){
  //     emit(ResultState.error(networkExceptions));
  //   });
  // }
  //
  // void getUserDetails(int id) {
  //   userRepo.getUserById(id).then((userDetails) {
  //     emit(GetUserDetails(userDetails));
  //   });
  // }
  //
  //
  void createNewUser(Users newUser) async{

    var data =await userRepo.createNewUser(newUser);
    data.when(success: (Users usersData){
      emit(ResultState.success(usersData));
    }, failure: (NetworkExceptions networkExceptions){
      emit(ResultState.error(networkExceptions));
    });
  }
  //
  //
  // void deleteUser (int id ) {
  //   userRepo.deleteUser(id).then((data) {
  //     emit(DeleteUSer(data));
  //   });
  // }
}
