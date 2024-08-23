
import 'package:news_app/Domain/entities/news_entities.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    super.status,
    super.copyright,
    super.section,
    super.lastUpdated,
    super.numResults,
    List<ResultModel>? super.results,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      section: json['section'] as String?,
      lastUpdated: json['last_updated'] as String?,
      numResults: json['num_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((item) => ResultModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'copyright': copyright,
      'section': section,
      'last_updated': lastUpdated,
      'num_results': numResults,
      'results': results?.map((item) => (item as ResultModel).toJson()).toList(),
    };
  }
}

class ResultModel extends ResultEntity {
  ResultModel({
    super.section,
    super.subsection,
    super.title,
    super.abstract,
    super.url,
    super.uri,
    super.byline,
    super.itemType,
    super.updatedDate,
    super.createdDate,
    super.publishedDate,
    super.materialTypeFacet,
    super.kicker,
    super.desFacet,
    super.orgFacet,
    super.perFacet,
    super.geoFacet,
    List<MultimediaModel>? super.multimedia,
    super.shortUrl,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      url: json['url'] as String?,
      uri: json['uri'] as String?,
      byline: json['byline'] as String?,
      itemType: json['item_type'] as String?,
      updatedDate: json['updated_date'] as String?,
      createdDate: json['created_date'] as String?,
      publishedDate: json['published_date'] as String?,
      materialTypeFacet: json['material_type_facet'] as String?,
      kicker: json['kicker'] as String?,
      desFacet: (json['des_facet'] as List<dynamic>?)?.map((e) => e as String).toList(),
      orgFacet: (json['org_facet'] as List<dynamic>?)?.map((e) => e as String).toList(),
      perFacet: (json['per_facet'] as List<dynamic>?)?.map((e) => e as String).toList(),
      geoFacet: (json['geo_facet'] as List<dynamic>?)?.map((e) => e as String).toList(),
      multimedia: (json['multimedia'] as List<dynamic>?)
          ?.map((item) => MultimediaModel.fromJson(item))
          .toList(),
      shortUrl: json['short_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'section': section,
      'subsection': subsection,
      'title': title,
      'abstract': abstract,
      'url': url,
      'uri': uri,
      'byline': byline,
      'item_type': itemType,
      'updated_date': updatedDate,
      'created_date': createdDate,
      'published_date': publishedDate,
      'material_type_facet': materialTypeFacet,
      'kicker': kicker,
      'des_facet': desFacet,
      'org_facet': orgFacet,
      'per_facet': perFacet,
      'geo_facet': geoFacet,
      'multimedia': multimedia?.map((item) => (item as MultimediaModel).toJson()).toList(),
      'short_url': shortUrl,
    };
  }
}

class MultimediaModel extends MultimediaEntity {
  MultimediaModel({
    super.url,
    super.format,
    super.height,
    super.width,
    super.type,
    super.subtype,
    super.caption,
    super.copyright,
  });

  factory MultimediaModel.fromJson(Map<String, dynamic> json) {
    return MultimediaModel(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'format': format,
      'height': height,
      'width': width,
      'type': type,
      'subtype': subtype,
      'caption': caption,
      'copyright': copyright,
    };
  }
}
