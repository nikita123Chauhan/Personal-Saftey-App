import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SafeWebView extends StatelessWidget {
  final String url;

  const SafeWebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View'),
        backgroundColor: Colors.purple,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
