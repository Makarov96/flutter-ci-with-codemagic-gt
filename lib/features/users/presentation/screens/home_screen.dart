import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/user_bloc.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key key}) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  void initState() {
    context.read<UserBloc>().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Consumer<UserBloc>(
          builder: (context, model, child) {
            return model.statusData == STATUSDATA.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: model.user.data.length,
                    itemBuilder: (_, i) {
                      final user = model.user.data[i];
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                user.avatar,
                              ),
                              maxRadius: 60,
                            ),
                            Text(
                              user.firstname,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
