import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'data.dart';
import 'support.dart';

class UserModel {
  final int page;
  final int perpage;
  final int total;
  final int totalpages;
  final List<Data> data;
  final Support support;
  UserModel({
    this.page,
    this.perpage,
    this.total,
    this.totalpages,
    this.data,
    this.support,
  });

  UserModel copyWith({
    int page,
    int perpage,
    int total,
    int totalpages,
    List<Data> data,
    Support support,
  }) {
    return UserModel(
      page: page ?? this.page,
      perpage: perpage ?? this.perpage,
      total: total ?? this.total,
      totalpages: totalpages ?? this.totalpages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'per_page': perpage,
      'total': total,
      'total_pages': totalpages,
      'data': data?.map((x) => x?.toMap())?.toList(),
      'support': support?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      page: map['page']?.toInt(),
      perpage: map['per_page']?.toInt(),
      total: map['total']?.toInt(),
      totalpages: map['total_pages']?.toInt(),
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
      support: Support.fromMap(map['support']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(page: $page, per_page: $perpage, total: $total, total_pages: $totalpages, data: $data, support: $support)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.page == page &&
        o.perpage == perpage &&
        o.total == total &&
        o.totalpages == totalpages &&
        listEquals(o.data, data) &&
        o.support == support;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        perpage.hashCode ^
        total.hashCode ^
        totalpages.hashCode ^
        data.hashCode ^
        support.hashCode;
  }
}
