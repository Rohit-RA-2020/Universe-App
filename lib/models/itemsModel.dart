import 'dart:convert';

class Item {
  int? index;
  String? name;
  String? map;
  String? imag;
  String? tagline;
  String? desc;

  Item({
    this.index,
    this.name,
    this.map,
    this.imag,
    this.tagline,
    this.desc,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      index: map["index"],
      name: map["name"],
      map: map["map"],
      imag: map["imag"],
      tagline: map["tagline"],
      desc: map["desc"],
    );
  }

  Item.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    map = json['map'];
    imag = json['imag'];
    tagline = json['tagline'];
    desc = json['desc'];
  }

  Item copyWith({
    int? index,
    String? name,
    String? map,
    String? imag,
    String? tagline,
    String? desc,
  }) {
    return Item(
      index: index ?? this.index,
      name: name ?? this.name,
      map: map ?? this.map,
      imag: imag ?? this.imag,
      tagline: tagline ?? this.tagline,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'name': name,
      'map': map,
      'imag': imag,
      'tagline': tagline,
      'desc': desc,
    };
  }

  String toJson() => json.encode(toMap());

  //factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(index: $index, name: $name, map: $map, imag: $imag, tagline: $tagline, desc: $desc)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.index == index &&
        o.name == name &&
        o.map == map &&
        o.imag == imag &&
        o.tagline == tagline &&
        o.desc == desc;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        name.hashCode ^
        map.hashCode ^
        imag.hashCode ^
        tagline.hashCode ^
        desc.hashCode;
  }
}
