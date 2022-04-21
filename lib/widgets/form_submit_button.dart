import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';

import 'package:pet_feeder/widgets/custom_widget.dart';

class FormSubmitButton extends CustomWidget {
  FormSubmitButton({required String text, required VoidCallback onPressed})
      : super(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onPressed: onPressed,
          color: Colors.indigo,
        );
}
