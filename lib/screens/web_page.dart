import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../local_data/url_data.dart';

class WebVeiwPage extends StatefulWidget {
  String webPage;
  WebVeiwPage({required this.webPage});

  @override
  State<WebVeiwPage> createState() => _WebVeiwPageState();
}

class _WebVeiwPageState extends State<WebVeiwPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController? _webViewController;
  final _localData = DataUrl();

  @override
  void initState() {
    super.initState();
    _checkLocalData();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  _checkLocalData() async {
    final urlData = await _localData.getLocalUrl();
    if (urlData.isEmpty) {
      _localData.saveLocalData(widget.webPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.future.then((controller) {
      _webViewController = controller;
      Map<String, String> header = {'Cookie': 'ASP.NET_SessionId=$controller'};
      _webViewController?.loadUrl(widget.webPage, headers: header);
    });
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController!.canGoBack()) {
          _webViewController?.goBack();
          return false;
        } else {
          return false;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels:  <JavascriptChannel>{
            _extractDataJSChannel(context),
            },
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              _webViewController = webViewController;
            },
            onPageFinished: (String url) {
              if (url.contains('/finalresponse.html')) { 
              _webViewController!.runJavascriptReturningResult("(function(){Flutter.postMessage(window.document.body.outerHTML)})();"); 
            }
            }),
          ),
        ),
      );
  }
}

JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
          name: 'Flutter',
          onMessageReceived: (JavascriptMessage message) {
                String pageBody = message.message;
                print('page body: $pageBody');
          },
       );
    }

