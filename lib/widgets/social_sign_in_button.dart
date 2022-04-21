import 'package:flutter/cupertino.dart';

import 'package:pet_feeder/widgets/custom_widget.dart';

class SocialSignInButton extends CustomWidget {
  SocialSignInButton(
      {required String text,
      required String imgUrl,
      required Color textColor,
      required Color color,
      required VoidCallback onPressed})
      : super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imgUrl,
                  scale: 0.7,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: Image.asset(imgUrl),
                )
              ],
            ),
            color: color,
            onPressed: onPressed);
}
