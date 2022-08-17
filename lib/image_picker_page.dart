import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String? path;

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 100,
          itemBuilder: ((context, index) => Card(
                color: Colors.amberAccent,
                child: Center(
                  child: Text('$index'),
                ),
              )),
        ),
      ),
    );
  }
}
