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
      body: Container(
        color: Colors.black38,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    color: Colors.red,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text('ImagePicker FakeTitle'),
                ],
              ),
              Container(
                child: path != null
                    ? Image(
                        image: AssetImage(
                          path!,
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                      )
                    : const Icon(Icons.abc_outlined),
              ),
              Container(
                color: Colors.black38,
                child: TextButton(
                    onPressed: () async {
                      XFile? image = await _picker.pickImage(source: ImageSource.camera);

                      setState(() {
                        if (image != null) {
                          path = image.path;
                        }
                      });
                    },
                    child: const Text("Image")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
