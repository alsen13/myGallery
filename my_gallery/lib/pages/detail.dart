import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../models/photo.dart';

class DetailPage extends StatelessWidget {

final Photo photo;
DetailPage(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.authorName),
      ),
      body: Container(
        child: Center(
          child: PhotoView (
            imageProvider: NetworkImage(photo.fullSize)
            ),
          ),
        ),
    );
  }
}
