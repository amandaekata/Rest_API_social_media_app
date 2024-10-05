

// Define the Comment class
class Comment {
 
  final String title;
  final String body;

  // Constructor
  Comment({
 
    required this.title,
    required this.body,
  });

  // Factory method to create a Comment from JSON
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
   
      title: json['title'],
      body: json['body'],
    );
  }

  // Method to convert a Comment to JSON
  Map<String, dynamic> toJson() {
    return {
    
      'title': title,
      'body': body,
    };
  }

 }
