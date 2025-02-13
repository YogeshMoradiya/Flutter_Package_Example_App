import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLuncherWidget extends StatelessWidget {
  const UrlLuncherWidget({super.key});

  Future<void>openAppWebView(String url)async{
    if(!await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView)){
      throw ('could not lunch $url');
    }
  }

  Future<void>openAppBrowserView(String url)async{
    if(!await launchUrl(Uri.parse(url),mode: LaunchMode.inAppBrowserView)){
      throw ('could not lunch $url');
    }
  }

  Future<void>openExternalApplication(String url)async{
    if(!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)){
      throw ('could not lunch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('url_launcher'),
        backgroundColor: Colors.grey,
      ),
      body:SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              openAppWebView('https://pub.dev/packages/url_launcher');
            }, child: const Text('App Web View')),
            ElevatedButton(onPressed: () {
              openAppBrowserView('https://pub.dev/packages/url_launcher');
            }, child: const Text('App Browser View')),
            ElevatedButton(onPressed: () {
              openExternalApplication('https://pub.dev/packages/url_launcher');
            }, child: const Text('External Application')),
          ],
        ),
      ),
    );
  }
}
