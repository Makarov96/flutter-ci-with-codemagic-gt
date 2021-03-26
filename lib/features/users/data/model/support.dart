import 'dart:convert';

class Support {
  final String url;
  final String text;
  Support({
    this.url,
    this.text,
  });

  Support copyWith({
    String url,
    String text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'text': text,
    };
  }

  factory Support.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Support(
      url: map['url'],
      text: map['text'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Support.fromJson(String source) => Support.fromMap(json.decode(source));

  @override
  String toString() => 'Support(url: $url, text: $text)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Support &&
      o.url == url &&
      o.text == text;
  }

  @override
  int get hashCode => url.hashCode ^ text.hashCode;
}