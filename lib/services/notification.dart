import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notification {
  final notificationsplugin = FlutterLocalNotificationsPlugin();
  bool _isInit = false;
  bool get isInit => _isInit;

  Future<void> initNotification() async {
    if (_isInit) return;

    const initSettingAndriod =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettingIos = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);

    const initSettings = InitializationSettings(
      android: initSettingAndriod,
      iOS: initSettingIos,
    );

    await notificationsplugin.initialize(initSettings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily_channel_id', 'Daily Notifications',
            channelDescription: 'Daily Notification Channal',
            importance: Importance.max,
            priority: Priority.high),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification({
    int id = 0,
    String? Title,
    String? Body,
  }) async {
    return notificationsplugin.show(id, Title, Body, notificationDetails());
  }
}
