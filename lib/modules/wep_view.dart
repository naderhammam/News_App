import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WepViewScreen extends StatelessWidget {
   const WepViewScreen({Key? key, required this.url}) : super(key: key);
final String url ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  WebView(
        initialUrl: url,
      ),
    );
  }
}
