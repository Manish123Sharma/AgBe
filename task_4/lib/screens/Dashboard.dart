import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task_4/widgets/Text_Field.dart';

class task_4 extends StatefulWidget {
  const task_4({Key? key}) : super(key: key);

  @override
  State<task_4> createState() => _task_4State();
}

class _task_4State extends State<task_4> {
  TextEditingController tc = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings("@mipmap/ic_launcher");
    var initSettings = new InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: selectNotification);
    super.initState();
  }

  selectNotification(String? payload) async {
    await showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("Message"),
          content: Text("Message : $payload"),
        );
      },
    );
  }

  Future _showNotificationWithSound() async {
    var androidPlatformChannelSpecifics =
        new AndroidNotificationDetails('your channel id', 'your channel name');

    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'Click on the Notification',
      platformChannelSpecifics,
      payload: '${tc.text}',
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications")),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text_field("Message", tc, deviceSize),
          ElevatedButton(
            onPressed: () {
              _showNotificationWithSound();
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 92, 136, 211)),
            child: const Text(
              'SUBMIT',
              style: TextStyle(color: Color.fromARGB(255, 21, 20, 20)),
            ),
          )
        ],
      ),
    );
  }
}
