// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bhajan {
  final String name;
  final String imageUrl;
  final String audioUrl;
  Bhajan({
    required this.name,
    required this.imageUrl,
    required this.audioUrl,
  });

  Bhajan copyWith({
    String? name,
    String? imageUrl,
    String? audioUrl,
  }) {
    return Bhajan(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
    };
  }

  factory Bhajan.fromMap(Map<String, dynamic> map) {
    return Bhajan(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      audioUrl: map['audioUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bhajan.fromJson(String source) =>
      Bhajan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Bhajan(name: $name, imageUrl: $imageUrl, audioUrl: $audioUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bhajan &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.audioUrl == audioUrl;
  }

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode ^ audioUrl.hashCode;
}
