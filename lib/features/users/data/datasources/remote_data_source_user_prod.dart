import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../model/user_model.dart';

@injectable
class RemoteDatasourceUserProd {
  Future<UserModel> getUserModelFromApi() async {
    try {
      final response = await http.get('https://reqres.in/api/users');
      return UserModel.fromJson(response.body);
    } catch (exception) {
      throw Failure(exception.toString());
    }
  }
}
