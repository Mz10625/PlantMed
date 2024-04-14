
import 'package:image_picker/image_picker.dart';

class ImageIO{
  Future<void> browseImage () async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  }
}