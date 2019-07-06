import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class NetworkManager {

  Future<List<Photo>> getPhotos() async {

    List<Photo> photos = [];
    
    var url =
        "https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0";
    
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      for (var item in jsonResponse) {
        var name =
            item['user']['name'] == null ? 'Some Author' : item['user']['name'];
        var location = item['user']['location'] == null
            ? 'Some Location'
            : item['user']['location'];

        photos.add(
            Photo(name, location, item['urls']['small'], item['urls']['full']));
      }
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }

    return photos;
  }
}