import 'package:injectable/injectable.dart';

import '../model/data.dart';
import '../model/support.dart';
import '../model/user_model.dart';

@injectable
class LocalDataSourceUserDev {
  final userLocalDataDev = UserModel(
    page: 1,
    perpage: 6,
    total: 12,
    totalpages: 2,
    support: Support(
      url: 'https://reqres.in/#support-heading',
      text: 'this is sample from local data',
    ),
    data: <Data>[
      Data(
        id: 2,
        email: 'janet.weaver@reqres.in',
        firstname: 'Janet',
        lastname: 'Weaver',
        avatar: 'https://reqres.in/img/faces/2-image.jpg',
      ),
    ],
  );

  Future<UserModel> myCustomData() => Future.value(userLocalDataDev);
}
