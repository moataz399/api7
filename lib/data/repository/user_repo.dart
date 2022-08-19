import 'package:api/api_result.dart';
import 'package:api/constants/strings.dart';
import 'package:api/network_exceptions.dart';

import '../../models/users.dart';
import '../web_services/web_services.dart';

class UserRepo {
  final WebServices webServices;

  UserRepo(this.webServices);

  Future<ApiResult<List<Users>>> getUsers() async {
    try {
      var data = await webServices.getUsers();

      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<Users> getUserById(int id) async {
    var response = await webServices.getUserById(id);

    //return Users.fromJson(response.toJson());
    return response;
  }

  Future<ApiResult<Users>> createNewUser(Users newUser) async {
    try {
      var data = await webServices.createNewUser(newUser, token);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<dynamic> deleteUser(int id) async {
    return await webServices.deleteUser(id, token);
  }
}
