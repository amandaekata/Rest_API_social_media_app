import 'dart:convert';

// Define the Photo class
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  // Constructor
  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // Factory method to create a Photo from JSON
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  // Method to convert a Photo to JSON
  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  @override
  String toString() {
    return 'Photo(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }
}

void main() {
  // Example JSON data
  String jsonString = '''
  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  }
  ''';

  // Parse JSON string
  Map<String, dynamic> jsonData = jsonDecode(jsonString);

  // Create a Photo object from JSON
  Photo photo = Photo.fromJson(jsonData);

  // Print the Photo object
  print(photo);

  // Convert Photo object back to JSON
  String jsonStringFromPhoto = jsonEncode(photo.toJson());
  print(jsonStringFromPhoto);
}
