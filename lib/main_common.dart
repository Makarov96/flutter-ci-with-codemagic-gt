import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'core/utils/config/config_reader.dart';
import 'core/utils/config/enviorments.dart';
import 'features/users/presentation/bloc/user_bloc.dart';
import 'injection.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initiaze();
  Color primaryColor;

  switch (env) {
    case Env.dev:
      configureInjection(Env.dev);
      primaryColor = Colors.blue;
      break;

    case Env.prod:
      configureInjection(Env.prod);
      primaryColor = Colors.green;
      break;
  }
  runApp(
    MultiProvider(
      providers: [
        Provider.value(
          value: primaryColor,
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<UserBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
