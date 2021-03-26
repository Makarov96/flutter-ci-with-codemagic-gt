import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/config/enviorments.dart';
import '../../datasources/remote_data_source_user_prod.dart';
import '../../model/user_model.dart';
import '../user_repositories.dart';

@prod
@Injectable(as: UserRepostories, env: [Env.prod])
class UserRepositoriesProdImpl implements UserRepostories {
  final RemoteDatasourceUserProd remoteDatasourceUserProd;
  UserRepositoriesProdImpl({
    @required this.remoteDatasourceUserProd,
  });

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final myUserList = await remoteDatasourceUserProd.getUserModelFromApi();
      return Right(myUserList);
    } on Failure {
      return Left(Failure('Error of call API'));
    }
  }
}
