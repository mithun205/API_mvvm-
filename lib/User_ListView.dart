import 'package:flutter/material.dart';
import 'package:mvvm_assignment/User_viewmodel.dart';
import 'package:provider/provider.dart';


class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
      title: const Center(child: Text('Users',
          style: TextStyle(fontWeight: FontWeight.w700),)),
      backgroundColor: Color.fromARGB(115, 75, 75, 75),),

      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          } else {
            return ListView.builder(
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return ListTile(
                  title: Text(user.name,
                  style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text(user.email,
                  style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
