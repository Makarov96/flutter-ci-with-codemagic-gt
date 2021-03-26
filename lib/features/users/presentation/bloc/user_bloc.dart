import 'package:flutter/cupertino.dart';
import 'package:flutter_gt_ci/features/users/data/model/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/user_repositories.dart';

enum STATUSDATA {
  loading,
  loaded,
  error,
}

@injectable
class UserBloc extends ChangeNotifier {
  final UserRepostories _userRepositories;
  STATUSDATA statusData = STATUSDATA.loading;

  UserBloc(
    this._userRepositories,
  );

  UserModel _user = UserModel();
  UserModel get user => _user;

  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }

  void getUser() async {
    final result = await _userRepositories.getUser();

    result.fold((left) {
      this.statusData = STATUSDATA.error;
    }, (right) {
      _user = right;
      this.statusData = STATUSDATA.loaded;
      notifyListeners();
    });
  }
}
