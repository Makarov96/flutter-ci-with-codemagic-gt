import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureInjection(String environment) =>
    $initGetIt(getIt, environment: environment);
