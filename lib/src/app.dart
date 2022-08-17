import 'package:flutter/material.dart';

class AudioCaptureApp extends StatefulWidget {
  const AudioCaptureApp(
      {Key? key, required this.child}

  ) : super(key: key);

  final Widget child;
  @override
  State<AudioCaptureApp> createState() => _AudioCaptureAppState();
}

class _AudioCaptureAppState extends State<AudioCaptureApp> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
