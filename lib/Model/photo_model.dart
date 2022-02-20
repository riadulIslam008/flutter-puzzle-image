class PhotoModel {
  int id;
  final String photoName;

  PhotoModel({
    required this.id,
    required this.photoName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photoName': photoName,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id']?.toInt() ?? 0,
      photoName: map['photoName'] ?? '',
    );
  }
}
