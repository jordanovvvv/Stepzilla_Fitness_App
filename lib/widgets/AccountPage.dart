import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class AccountPage extends StatelessWidget{
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
      title: 'Account Settings',
      subtitle: 'Privacy, Security, Language',
      leading: Icon(Icons.person),
      child: SettingsScreen(
        title: 'Account Settings',
        children: <Widget>[
          DropDownSettingsTile(
              title: 'Language',
              settingKey: keyLanguage,
              selected: 1,
              values: <int, String>{
                1: 'English',
                2: 'Macedonian',
                3: 'German'
              },
              onChange: (language) {},
          ),
          TextInputSettingsTile(
              title: 'Location',
              settingKey: keyLocation,
              initialValue: 'Macedonia',
              onChange: (location) {},
          ),
          SimpleSettingsTile(
            title: 'Privacy',
            subtitle: '',
            leading: Icon(Icons.privacy_tip),
            onTap: (){},
          ),
          SimpleSettingsTile(
            title: 'Security',
            subtitle: '',
            leading: Icon(Icons.security),
            onTap: (){},
          ),
          SimpleSettingsTile(
            title: 'Account Info',
            subtitle: '',
            leading: Icon(Icons.info),
            onTap: (){},
          ),
        ],
      ),
  );
}