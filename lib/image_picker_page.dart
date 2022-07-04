import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    // final ImagePicker _picker = ImagePicker();
    String path = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage(
                  path,
                ),
              ),
            ),
            Container(
              color: Colors.black38,
              child: TextButton(
                  onPressed: () async {
                    // PickedFile? image =
                        // await _picker.
                    // path = image?.path ?? '';
                    // print(path);
                  },
                  child: const Text("Image")),
            )
          ],
        ),
      ),
    );
  }
}
