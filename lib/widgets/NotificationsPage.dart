import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class NotificationsPage extends StatelessWidget{
  static const keyNews = 'key-news';
  static const keyActivity = 'key-activity';
  static const keyNewsletter = 'key-newsletter';
  static const keyUpdates = 'key-updates';


  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
      title: 'Notifications',
      subtitle: 'Newsletter, App Updates',
      leading: Icon(Icons.notifications),
      child: SettingsScreen(
        title: 'Notifications',
        children: [
          SwitchSettingsTile(
              title: 'News For You',
              settingKey: keyNews,
              leading: Icon(Icons.newspaper),
          ),
          SwitchSettingsTile(
            title: 'Account Activity',
            settingKey: keyActivity,
            leading: Icon(Icons.account_circle),
          ),
          SwitchSettingsTile(
            title: 'Newsletter',
            settingKey: keyNewsletter,
            leading: Icon(Icons.new_releases_sharp),
          ),
          SwitchSettingsTile(
            title: 'App Updates',
            settingKey: keyUpdates,
            leading: Icon(Icons.update),
          ),
        ],
      ),
  );
}