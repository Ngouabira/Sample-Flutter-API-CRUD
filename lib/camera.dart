import 'package:flutter/material.dart';
import 'package:flutter_with_api/calculatrice.dart';
import 'package:image_picker/image_picker.dart ';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  var image = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Home'),
            ),
            ListTile(
              title: const Text('List'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CameraPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Calculator'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CalculatorPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          image == null ? Text("No picture") : Image.asset(image!),
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () async {
              getImage(ImageSource.camera);
            },
            child: Icon(Icons.camera_enhance),
          ),
          FloatingActionButton(
            onPressed: () async {
              getImage(ImageSource.gallery);
            },
            child: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile == null) return;
  }

  Future getImage(ImageSource imageSource) async {
    var picker = await ImagePicker.platform.pickImage(source: imageSource);
    setState(() {
      image = picker?.path;
    });
  }
}
