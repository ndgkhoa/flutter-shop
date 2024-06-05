import 'package:flutter_application_1/views/shared/export.dart';
import 'package:flutter_application_1/views/shared/export_packages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('This is profile',
                style: appstyle(40, Colors.black, FontWeight.bold))));
  }
}
