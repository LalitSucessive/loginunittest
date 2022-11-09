import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstantView {
  // ignore: non_constant_identifier_names

  static String APPBAR_TITLE_HOME = "Home Page";
  static String LOGIN_BUTTON = "Login";
  static String SIGNUP_BUTTON = "Signup";
  static String WELCOME = "Welcome";
}

Widget image() {
  return SizedBox(
    // width: MediaQuery.of(context).size.width / 1.5,
    child: CachedNetworkImage(
      imageUrl: "https://miro.medium.com/max/1400/1*vjLffx_0P6PuIsSDnMUUpQ.png",
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}
