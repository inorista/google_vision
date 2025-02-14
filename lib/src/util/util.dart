import 'dart:convert';

import 'package:universal_io/io.dart';

/// Utility methods
class Util {
  static String base64GCloudString(String data) =>
      Util.base64GCloudList(utf8.encode(data));

  static String base64GCloudList(List<int> data) => base64
      .encode(data)
      .replaceAll('/', '_')
      .replaceAll('+', '-')
      .replaceAll('=', '');

  /// Convert a [DateTime] to a Unix Timestamp.
  static int unixTimeStamp(DateTime dt) =>
      dt.toUtc().millisecondsSinceEpoch ~/ 1000;

  static T cast<T>(dynamic x, {required T fallback}) => x is T ? x : fallback;

  static String getUploadIdFromUrl(String locationUrl) {
    final locationUri = Uri.parse(locationUrl);

    if (!locationUri.queryParameters.containsKey('upload_id')) {
      throw Exception('The uplaod ID has not been found.');
    }

    return locationUri.queryParameters['upload_id']!;
  }

  /// Attempt to retrieve the 'home' folder of the user if running on a desktop.
  static String? get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
}
