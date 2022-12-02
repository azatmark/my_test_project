import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class FireRepository {
  Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.fetch();
      await remoteConfig.activate();
      if (kDebugMode) {
        print(remoteConfig.getString('key'));
      }
      return remoteConfig;
    } catch (e) {
      if (kDebugMode) {
        print('Could not data Firebase: $e');
      }
      rethrow;
    }
  }
}
