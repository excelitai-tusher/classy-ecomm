import 'package:ecom_login_project/drawer/settings.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';
import 'dashboard.dart';
import 'my_drawer_header.dart';
import 'my_drawer_list.dart';
import 'notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var currentPage = DrawerSections.dashboard;
  var currentPage1 = DrawerSections.contacts;
  var currentPage2 = DrawerSections.settings;
  var currentPage3 = DrawerSections.notifications;

  @override
  Widget build(BuildContext context) {
    var Container;
    if(currentPage == DrawerSections.dashboard){
      Container = Dashboard();
    }else if(currentPage1 == DrawerSections.contacts){
      Container = Contacts();
    }else if(currentPage2 == DrawerSections.settings){
      Container = settings();
    }else if(currentPage3 == DrawerSections.notifications){
      Container = notifications();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Drawer page"),
      ),
      body: Container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
               MyHeaderDrawer(),
               MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }
}

