import 'package:flutter/material.dart';
import 'package:appcheck/appcheck.dart';
import 'package:url_launcher/url_launcher.dart';

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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.visibility), // Eye icon
            onPressed: () {
              // Implement functionality here
            },
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          children: <Widget>[
            _buildButton(
              context,
              Icons.photo_album,
              'Image Labeling',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageLabelView()),
              ),
            ),
            _buildButton(
              context,
              Icons
                  .emoji_food_beverage_rounded, // Changed icon for better representation
              'Object Detection',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ObjectDetectorView()),
              ),
            ),
            _buildButton(
              context,
              Icons.map, // Changed icon for better representation
              'ARCore Mapping',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ObjectGesturesWidget()),
              ),
            ),
            _buildButton(context, Icons.navigation, 'VisioMateNavigator',
                () async {

              final website = Uri(
                  scheme: 'https',
                  host: 'github.com',
                  path: '/theCWBGroup/VisioMateNavigator/releases');
              var flag = 0;
              final installedApps = await AppCheck.getInstalledApps();
              if (installedApps != null) {
                for (var app in installedApps) {
                  if (app.packageName.contains('festunavigator')) {
                    debugPrint('Launching ${app.packageName}');
                    await AppCheck.launchApp(app.packageName);
                    flag = 1;
                    break;
                  }
                }
              } else {
                debugPrint('No apps found');
              }
              if (flag == 0) launchUrl(website);
              //}
              debugPrint('No apps found');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String text,
      VoidCallback onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(Size(100, 100)),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 30), // Increased icon size for better visibility
          SizedBox(height: 10), // Added space between icon and text
          Text(text, style: TextStyle(fontSize: 16)), // Adjusted text style
        ],
      ),
    );
  }
}
