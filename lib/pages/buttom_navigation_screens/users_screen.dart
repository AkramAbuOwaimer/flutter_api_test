import 'package:flutter/material.dart';
import 'package:flutter_api_test/models/user.dart';
import 'package:flutter_api_test/services/api/controllers/user_api_controller.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<User>> _usersFuture;
  List<User> _users = [];
  @override
  void initState() {
    super.initState();
    _usersFuture = UserApiController().indexUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              _users = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    var _user = _users.elementAt(index);
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text('${_user.firstName} ${_user.lastName}'),
                      subtitle: Text(_user.jobTitle),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  });
            } else {
              return Center(
                child: Column(
                  children: [
                    Icon(Icons.warning),
                    Text(
                      'No Data',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
          }
        });
  }
}
