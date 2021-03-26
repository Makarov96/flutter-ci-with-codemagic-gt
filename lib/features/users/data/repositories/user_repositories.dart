import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

import '../model/user_model.dart';

abstract class UserRepostories {
  Future<Either<Failure, UserModel>> getUser();
}
