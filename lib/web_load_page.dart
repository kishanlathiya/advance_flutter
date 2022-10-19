import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebLoad extends StatefulWidget {
  const WebLoad({Key? key}) : super(key: key);

  @override
  State<WebLoad> createState() => _WebLoadState();
}

class _WebLoadState extends State<WebLoad> {
  late InAppWebViewController? webViewController;
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    dynamic e = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff54759e),
        title: const Text("Web View"),
        centerTitle: true,
      ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: Uri.parse(e.value)),
      ),
    );
  }
}
