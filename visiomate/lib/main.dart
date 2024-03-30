import 'package:ar_flutter_plugin_flutterflow/ar_flutter_plugin.dart';
import 'package:flutter/material.dart';

import 'vision_detector_views/arcore_detector_view.dart';
import 'vision_detector_views/label_detector_view.dart';
import 'vision_detector_views/object_detector_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VisioMate'),
        // add eye icon to the app bar
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // square shape
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(100, 100)), // square size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageLabelView()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min, // take the minimum space
                children: <Widget>[
                  Icon(Icons.photo_album), // eye icon
                  Text('Image Labeling'),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // square shape
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(100, 100)), // square size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ObjectDetectorView()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min, // take the minimum space
                children: <Widget>[
                  Icon(Icons.yard),
                  Text('Object Detection'),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // square shape
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(100, 100)), // square size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      //builder: (context) => ObjectDetectorView()),
                      builder: (context) => ObjectGesturesWidget()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min, // take the minimum space
                children: <Widget>[
                  Icon(Icons.yard),
                  Text('ARCore_Mapping'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
