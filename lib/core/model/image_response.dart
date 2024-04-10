// To parse this JSON data, do
//
//     final imageResponseModel = imageResponseModelFromJson(jsonString);

import 'dart:convert';

ImageResponseModel imageResponseModelFromJson(String str) => ImageResponseModel.fromJson(json.decode(str));

String imageResponseModelToJson(ImageResponseModel data) => json.encode(data.toJson());

class ImageResponseModel {
    String? id;
    String? className;
    double? confidenceScore;
    List<String>? suggestions;
    String? imageUrl;

    ImageResponseModel({
        this.id,
        this.className,
        this.confidenceScore,
        this.suggestions,
        this.imageUrl,
    });

    factory ImageResponseModel.fromJson(Map<String, dynamic> json) => ImageResponseModel(
        id: json["_id"],
        className: json["Class Name"],
        confidenceScore: json["Confidence Score"]?.toDouble(),
        suggestions: json["Suggestions"] == null ? [] : List<String>.from(json["Suggestions"]!.map((x) => x)),
        imageUrl: json["Image URL"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Class Name": className,
        "Confidence Score": confidenceScore,
        "Suggestions": suggestions == null ? [] : List<dynamic>.from(suggestions!.map((x) => x)),
        "Image URL": imageUrl,
    };
}
