import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  _MyDrawerListState createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  var currentPage = DrawerSections.dashboard;
  var currentPage1 = DrawerSections.contacts;
  var currentPage2 = DrawerSections.settings;
  var currentPage3 = DrawerSections.notifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "contacts", Icons.people_alt_outlined,
              currentPage1 == DrawerSections.contacts ? true : false),
          menuItem(3, "settings", Icons.settings_applications_outlined,
              currentPage2 == DrawerSections.settings ? true : false),
          menuItem(4, "notifications", Icons.notifications,
              currentPage3 == DrawerSections.notifications ? true : false),
        ],
      ),
    );

  }
  Widget menuItem(int id, String title, IconData icon, bool selected){
    return Material(
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id == 1){
              currentPage == DrawerSections.dashboard;
            } else if(id == 2){
              currentPage1 == DrawerSections.contacts;
            }else if(id == 3){
              currentPage2 == DrawerSections.settings;
            }else if(id == 3){
              currentPage3 == DrawerSections.notifications;
          }});
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                    icon,
                    //Icons.dashboard_outlined,
                    size: 20,
                    color: Colors.green,
                  ),
              ),

              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    //"Dashboard",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections{
  dashboard,
  contacts,
  settings,
  notifications,
}
