import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

// Renaming the widget class to avoid conflict
class CachedNetworkImageExample extends StatefulWidget {
  const CachedNetworkImageExample({super.key});

  @override
  State<CachedNetworkImageExample> createState() => _CachedNetworkImageExampleState();
}

class _CachedNetworkImageExampleState extends State<CachedNetworkImageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CachedNetworkImage'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: "http://mvs.bslmeiyu.com/storage/profile/2022-05-02-626fc39bf18a6.png",
              imageBuilder: (context, imageProvider) => Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Image.asset("images/flutter.png"),
            ),
          ],
        ),
      ),
    );
  }
}
