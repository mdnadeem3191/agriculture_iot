import 'dart:convert';

class MainDashBoardModel {
  final Channel? channel;
  final List<Feed>? feeds;

  MainDashBoardModel({
    this.channel,
    this.feeds,
  });

  MainDashBoardModel copyWith({
    Channel? channel,
    List<Feed>? feeds,
  }) =>
      MainDashBoardModel(
        channel: channel ?? this.channel,
        feeds: feeds ?? this.feeds,
      );

  factory MainDashBoardModel.fromRawJson(String str) =>
      MainDashBoardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainDashBoardModel.fromJson(Map<String, dynamic> json) =>
      MainDashBoardModel(
        channel:
            json["channel"] == null ? null : Channel.fromJson(json["channel"]),
        feeds: json["feeds"] == null
            ? []
            : List<Feed>.from(json["feeds"]!.map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "channel": channel?.toJson(),
        "feeds": feeds == null
            ? []
            : List<dynamic>.from(feeds!.map((x) => x.toJson())),
      };
}

class Channel {
  final int? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? field1;
  final String? field2;
  final String? field3;
  final String? field4;
  final String? field5;
  final String? field6;
  final String? field7;
  final String? field8;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? lastEntryId;

  Channel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.field1,
    this.field2,
    this.field3,
    this.field4,
    this.field5,
    this.field6,
    this.field7,
    this.field8,
    this.createdAt,
    this.updatedAt,
    this.lastEntryId,
  });

  Channel copyWith({
    int? id,
    String? name,
    String? latitude,
    String? longitude,
    String? field1,
    String? field2,
    String? field3,
    String? field4,
    String? field5,
    String? field6,
    String? field7,
    String? field8,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? lastEntryId,
  }) =>
      Channel(
        id: id ?? this.id,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        field1: field1 ?? this.field1,
        field2: field2 ?? this.field2,
        field3: field3 ?? this.field3,
        field4: field4 ?? this.field4,
        field5: field5 ?? this.field5,
        field6: field6 ?? this.field6,
        field7: field7 ?? this.field7,
        field8: field8 ?? this.field8,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lastEntryId: lastEntryId ?? this.lastEntryId,
      );

  factory Channel.fromRawJson(String str) => Channel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        field1: json["field1"],
        field2: json["field2"],
        field3: json["field3"],
        field4: json["field4"],
        field5: json["field5"],
        field6: json["field6"],
        field7: json["field7"],
        field8: json["field8"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lastEntryId: json["last_entry_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "field1": field1,
        "field2": field2,
        "field3": field3,
        "field4": field4,
        "field5": field5,
        "field6": field6,
        "field7": field7,
        "field8": field8,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "last_entry_id": lastEntryId,
      };
}

class Feed {
  final DateTime? createdAt;
  final int? entryId;
  final String? field1;
  final String? field2;
  final String? field3;
  final String? field4;
  final String? field5;
  final dynamic field6;
  final dynamic field7;
  final dynamic field8;

  Feed({
    this.createdAt,
    this.entryId,
    this.field1,
    this.field2,
    this.field3,
    this.field4,
    this.field5,
    this.field6,
    this.field7,
    this.field8,
  });

  Feed copyWith({
    DateTime? createdAt,
    int? entryId,
    String? field1,
    String? field2,
    String? field3,
    String? field4,
    String? field5,
    dynamic field6,
    dynamic field7,
    dynamic field8,
  }) =>
      Feed(
        createdAt: createdAt ?? this.createdAt,
        entryId: entryId ?? this.entryId,
        field1: field1 ?? this.field1,
        field2: field2 ?? this.field2,
        field3: field3 ?? this.field3,
        field4: field4 ?? this.field4,
        field5: field5 ?? this.field5,
        field6: field6 ?? this.field6,
        field7: field7 ?? this.field7,
        field8: field8 ?? this.field8,
      );

  factory Feed.fromRawJson(String str) => Feed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        entryId: json["entry_id"],
        field1: json["field1"],
        field2: json["field2"],
        field3: json["field3"],
        field4: json["field4"],
        field5: json["field5"],
        field6: json["field6"],
        field7: json["field7"],
        field8: json["field8"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "entry_id": entryId,
        "field1": field1,
        "field2": field2,
        "field3": field3,
        "field4": field4,
        "field5": field5,
        "field6": field6,
        "field7": field7,
        "field8": field8,
      };
}
