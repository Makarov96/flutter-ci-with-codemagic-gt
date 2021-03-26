// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/users/data/datasources/local_data_source_user_dev.dart';
import 'features/users/data/datasources/remote_data_source_user_prod.dart';
import 'features/users/presentation/bloc/user_bloc.dart';
import 'features/users/data/repositories/dev/user_repositories_dev_impl.dart';
import 'features/users/data/repositories/prod/user_repositories_prod_impl.dart';
import 'features/users/data/repositories/user_repositories.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<LocalDataSourceUserDev>(() => LocalDataSourceUserDev());
  gh.factory<RemoteDatasourceUserProd>(() => RemoteDatasourceUserProd());
  gh.factory<UserRepostories>(
      () => UserRepositoriesDevImpl(
          localDataSourceUserDev: get<LocalDataSourceUserDev>()),
      registerFor: {_dev});
  gh.factory<UserRepostories>(
      () => UserRepositoriesProdImpl(
          remoteDatasourceUserProd: get<RemoteDatasourceUserProd>()),
      registerFor: {_prod});
  gh.factory<UserBloc>(() => UserBloc(get<UserRepostories>()));
  return get;
}
