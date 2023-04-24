// To parse this JSON data, do
//
//     final playlistItem = playlistItemFromJson(jsonString);

import 'dart:convert';

PlaylistItem playlistItemFromJson(String str) => PlaylistItem.fromJson(json.decode(str));

String playlistItemToJson(PlaylistItem data) => json.encode(data.toJson());

class PlaylistItem {
  PlaylistItem({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.items,
    required this.pageInfo,
  });

  String kind;
  String etag;
  String nextPageToken;
  List<Item> items;
  PageInfo pageInfo;

  factory PlaylistItem.fromJson(Map<String, dynamic> json) => PlaylistItem(
    kind: json["kind"],
    etag: json["etag"],
    nextPageToken: json["nextPageToken"]??'',
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "pageInfo": pageInfo.toJson(),
  };
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.contentDetails,
    required this.status,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;
  Status status;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    snippet: Snippet.fromJson(json["snippet"]),
    contentDetails: ContentDetails.fromJson(json["contentDetails"]),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
    "contentDetails": contentDetails.toJson(),
    "status": status.toJson(),
  };
}

class ContentDetails {
  ContentDetails({
    required this.videoId,
    required this.videoPublishedAt,
  });

  String videoId;
  DateTime videoPublishedAt;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
    videoId: json["videoId"],
    videoPublishedAt: DateTime.parse(json["videoPublishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "videoId": videoId,
    "videoPublishedAt": videoPublishedAt.toIso8601String(),
  };
}

class Snippet {
  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.resourceId,
    required this.videoOwnerChannelTitle,
    required this.videoOwnerChannelId,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String playlistId;
  int position;
  ResourceId resourceId;
  String videoOwnerChannelTitle;
  String videoOwnerChannelId;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"],
    title: json["title"],
    description: json["description"],
    thumbnails: Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"],
    playlistId: json["playlistId"],
    position: json["position"],
    resourceId: ResourceId.fromJson(json["resourceId"]),
    videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
    videoOwnerChannelId: json["videoOwnerChannelId"],
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitle,
    "playlistId": playlistId,
    "position": position,
    "resourceId": resourceId.toJson(),
    "videoOwnerChannelTitle": videoOwnerChannelTitle,
    "videoOwnerChannelId": videoOwnerChannelId,
  };
}

class ResourceId {
  ResourceId({
    required this.kind,
    required this.videoId,
  });

  String kind;
  String videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
    kind: json["kind"],
    videoId: json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "videoId": videoId,
  };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
    this.standard,
    this.maxres,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: Default.fromJson(json["default"]),
    medium: Default.fromJson(json["medium"]),
    high: Default.fromJson(json["high"]),
    standard: json["standard"] == null ? null : Default.fromJson(json["standard"]),
    maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault.toJson(),
    "medium": medium.toJson(),
    "high": high.toJson(),
    "standard": standard?.toJson(),
    "maxres": maxres?.toJson(),
  };
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class Status {
  Status({
    required this.privacyStatus,
  });

  String privacyStatus;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    privacyStatus: json["privacyStatus"],
  );

  Map<String, dynamic> toJson() => {
    "privacyStatus": privacyStatus,
  };
}

class PageInfo {
  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}
