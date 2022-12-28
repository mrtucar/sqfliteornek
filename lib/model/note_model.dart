class Note {
  final int? id;
  final String title;
  final String description;

  const Note({required this.title,
    required this.description,
    required this.id});

  factory Note.fromJson(Map<String,dynamic> json) {
    return Note(id:json['id'],
    title: json['title'],
    description: json['description']);
  }

  Map<String,dynamic> toJson() {
    return {'id': id,
      'title': title,
      'description': description
    };
  }
}
