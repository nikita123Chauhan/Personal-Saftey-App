// import 'dart:async';
// import 'dart:ui';

// import 'package:background_location/background_location.dart';
// import 'package:background_sms/background_sms.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:shake/shake.dart';
// import 'package:telephony/telephony.dart';
// import 'package:vibration/vibration.dart';
// import 'package:her_safety/db/db_services.dart';
// import 'package:her_safety/model/contactsm.dart';

// sendMessage(String messageBody) async {
//   List<TContact> contactList = await DatabaseHelper().getContactList();
//   if (contactList.isEmpty) {
//     Fluttertoast.showToast(msg: "No number exists, please add a number.");
//   } else {
//     for (var contact in contactList) {
//       Telephony.backgroundInstance.sendSms(
//         to: contact.number,
//         message: messageBody,
//       );
//     }
//     Fluttertoast.showToast(msg: "Message sent.");
//   }
// }

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();

//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     "script_academy",
//     "foreground_service",
//     description: "Used for important notifications",
//     importance: Importance.low,
//   );

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   await service.configure(
//       iosConfiguration: IosConfiguration(),
//       androidConfiguration: AndroidConfiguration(
//         onStart: onStart,
//         isForegroundMode: true,
//         autoStart: true,
//         notificationChannelId: "script_academy",
//         initialNotificationTitle: "Foreground Service",
//         initialNotificationContent: "Initializing...",
//         foregroundServiceNotificationId: 888,
//       ));
//   service.startService();
// }

// @pragma('vm-entry-point')
// void onStart(ServiceInstance service) {
//   Location? clocation;

//   DartPluginRegistrant.ensureInitialized();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });
//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   service.on('stopService').listen((event) {
//     service.stopSelf();
//   });

//   BackgroundLocation.setAndroidNotification(
//     title: "Location tracking is running in the background!",
//     message: "You can turn it off from the settings menu inside the app.",
//     icon: '@mipmap/ic_logo',
//   );

//   BackgroundLocation.startLocationService(distanceFilter: 20);

//   BackgroundLocation.getLocationUpdates((location) {
//     clocation = location;
//   });

//   if (service is AndroidServiceInstance) {
//     if (service.isForegroundService() as bool) {
//       ShakeDetector.autoStart(
//         shakeThresholdGravity: 7,
//         shakeSlopTimeMS: 500,
//         shakeCountResetTime: 3000,
//         minimumShakeCount: 1,
//         onPhoneShake: () {
//           handleShakeEvent(clocation);
//         },
//       );

//       flutterLocalNotificationsPlugin.show(
//         888,
//         "Women Safety App",
//         clocation == null
//             ? "Please enable location to use the app."
//             : "Shake feature enabled at ${clocation!.latitude}",
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             "script_academy",
//             "foreground_service",
//             description: "Used for important notifications",
//             icon: 'ic_bg_service_small',
//             ongoing: true,
//           ),
//         ),
//       );
//     }
//   }
// }

// // ✅ Fix: Moved shake event logic to a separate synchronous function
// void handleShakeEvent(Location? clocation) {
//   if (clocation == null) {
//     Fluttertoast.showToast(msg: "Location is null. Cannot send alert.");
//     return;
//   }

//   if (Vibration.hasVibrator() ?? false) {
//     Vibration.hasCustomVibrationsSupport().then((hasCustomVibrations) {
//       if (hasCustomVibrations ?? false) {
//         Vibration.vibrate(duration: 1000);
//       } else {
//         Vibration.vibrate();
//         Future.delayed(const Duration(milliseconds: 500), () {
//           Vibration.vibrate();
//         });
//       }
//     });
//   }

//   String messageBody =
//       "https://www.google.com/maps/search/?api=1&query=${clocation.latitude}%2C${clocation.longitude}";

//   sendMessage(messageBody);
// }
