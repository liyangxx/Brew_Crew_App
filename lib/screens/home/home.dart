import 'package:brew_crew_app/models/brew.dart';
import 'package:brew_crew_app/screens/home/settings_form.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:brew_crew_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: const SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      initialData: const [],
      value: DatabaseService(uid: '').brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                }),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const BrewList(),
        ),
      ),
    );
  }
}
