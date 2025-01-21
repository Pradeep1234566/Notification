import 'package:flutter/material.dart';
import 'package:notification/services/notification.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationService = NotificationService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Test'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            notificationService.showNotification(
              title: 'Test Notification',
              body: 'This is a sample notification to test your setup.',
            );
          },
          child: const Text('Show Notification'),
        ),
      ),
    );
  }
}
