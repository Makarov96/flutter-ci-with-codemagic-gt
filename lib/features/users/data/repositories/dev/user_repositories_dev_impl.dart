import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/config/enviorments.dart';
import '../../datasources/local_data_source_user_dev.dart';
import '../../model/user_model.dart';
import '../user_repositories.dart';

@dev
@Injectable(as: UserRepostories, env: [Env.dev])
class UserRepositoriesDevImpl implements UserRepostories {
  final LocalDataSourceUserDev localDataSourceUserDev;

  UserRepositoriesDevImpl({
    @required this.localDataSourceUserDev,
  });
  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final myUserList = await localDataSourceUserDev.myCustomData();
      return Right(myUserList);
    } on Failure {
      return Left(Failure('Error of call API'));
    }
  }
}
