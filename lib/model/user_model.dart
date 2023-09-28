



final String tableNotes = 'User';

class NoteFields {
  static final List<String> values = [
    id, title,email,password
  ];


  static final String id = '_id';
  static final String title = 'title';
  static final String email = 'email';
  static final String password = 'password';
}

class Note {
  final int? id;
  final String title;
  final String email;
  final String password;

  const Note({
    this.id,
    required this.title,
    required this.email,
    required this.password,
  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? email,
    String? password,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    title: json[NoteFields.title] as String,
    email: json[NoteFields.email] as String,
    password: json[NoteFields.password] as String,
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.title: title,
    NoteFields.email: email,
    NoteFields.password: password,
  };
}