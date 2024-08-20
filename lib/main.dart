import 'package:flutter/material.dart';
import 'package:mvvm_assignment/User_ListView.dart';
import 'package:mvvm_assignment/User_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MvvM_asses());
}

class MvvM_asses extends StatelessWidget {
  const MvvM_asses({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel()..loadUsers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListView(),
        
      ),
    );
  }
}
