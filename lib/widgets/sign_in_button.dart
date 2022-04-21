import 'package:flutter/cupertino.dart';

import 'package:pet_feeder/widgets/custom_widget.dart';

class SignInButton extends CustomWidget {
  SignInButton({
    required String text,
    required Color textColor,
    required Color color,
    required VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          color: color,
          onPressed: onPressed,
        );
}
