import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/users/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<Color>(context),
      ),
      title: 'Material App Prod',
      home: HomeUser(),
    );
  }
}
