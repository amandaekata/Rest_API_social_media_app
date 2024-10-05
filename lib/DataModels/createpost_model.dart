

// Define the Post class
class Post {
 
  final String title;
  final String body;

  Post({
 
    required this.title,
    required this.body,
  });

  // Factory method to create a Post from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
     
 
      title: json['title'],
      body: json['body'],
    );
  }

  // Convert a Post instance to JSON
  Map<String, dynamic> toJson() {
    return {
      
      'title': title,
      'body': body,
    };
  }
}

// Example usage

