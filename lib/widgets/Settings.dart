import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:stepzilla/NavBar.dart';
import 'package:stepzilla/widgets/AccountPage.dart';
import 'package:stepzilla/widgets/NotificationsPage.dart';

class Settings extends StatefulWidget{

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              SettingsGroup(
                  title: 'GENERAL',
                  children: <Widget>[
                    AccountPage(),
                    NotificationsPage(),
                    SimpleSettingsTile(
                    title: 'Logout',
                      subtitle: '',
                      leading: Icon(Icons.logout),
                      onTap: (){},
                    ),
                    SimpleSettingsTile(
                      title: 'Delete Account',
                      subtitle: '',
                      leading: Icon(Icons.delete),
                      onTap: (){},
                    ),
                    SimpleSettingsTile(
                      title: 'Change Password',
                      subtitle: '',
                      leading: Icon(Icons.password),
                      onTap: (){},
                    ),
                  ]
              ),
              SettingsGroup(
                  title: 'FEEDBACK',
                  children: [
                    SimpleSettingsTile(
                      title: 'Report a bug',
                      subtitle: '',
                      leading: Icon(Icons.bug_report),
                      onTap: (){},
                    ),
                    SimpleSettingsTile(
                      title: 'Send Feedback',
                      subtitle: '',
                      leading: Icon(Icons.feedback),
                      onTap: (){},
                    ),
                    SimpleSettingsTile(
                      title: 'Message Us',
                      subtitle: '',
                      leading: Icon(Icons.message),
                      onTap: (){},
                    ),
                  ]
              )
            ],
          ),
        )
    );
  }

}