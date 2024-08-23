
import 'package:news_app/Domain/entities/some_root_entity.dart';



class MediaModel extends MediaEntity {
  MediaModel({
    super.type,
    super.subtype,
    super.caption,
    super.copyright,
    super.approvedForSyndication,
    List<MediaMetadataModel>? super.mediaMetadata,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
      approvedForSyndication: json['approved_for_syndication'] as int?,
      mediaMetadata: (json['media-metadata'] as List<dynamic>?)
          ?.map((e) => MediaMetadataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }


}

class MediaMetadataModel extends MediaMetadataEntity {
  MediaMetadataModel({
    super.url,
    super.format,
    super.height,
    super.width,
  });

  factory MediaMetadataModel.fromJson(Map<String, dynamic> json) {
    return MediaMetadataModel(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'format': format,
      'height': height,
      'width': width,
    };
  }
}

class ArticleResultModel extends ArticleResultEntity {
  ArticleResultModel({
    super.uri,
    super.url,
    super.id,
    super.assetId,
    super.source,
    super.publishedDate,
    super.updated,
    super.section,
    super.subsection,
    super.nytdsection,
    super.adxKeywords,
    super.column,
    super.byline,
    super.type,
    super.title,
    super.abstractText,
    super.desFacet,
    super.orgFacet,
    super.perFacet,
    super.geoFacet,
    List<MediaModel>? super.media,
    super.etaId,
  });

  factory ArticleResultModel.fromJson(Map<String, dynamic> json) {
    return ArticleResultModel(
      uri: json['uri'] as String?,
      url: json['url'] as String?,
      id: json['id'] as int?,
      assetId: json['asset_id'] as int?,
      source: json['source'] as String?,
      publishedDate: json['published_date'] as String?,
      updated: json['updated'] as String?,
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      nytdsection: json['nytdsection'] as String?,
      adxKeywords: json['adx_keywords'] as String?,
      column: json['column'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      abstractText: json['abstract'] as String?,
      desFacet: (json['des_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orgFacet: (json['org_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perFacet: (json['per_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geoFacet: (json['geo_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      etaId: json['eta_id'] as int?,
    );
  }


}

class SomeRootModel extends SomeRootEntity {
  SomeRootModel({
    super.status,
    super.copyright,
    super.numResults,
    List<ArticleResultModel>? super.results,
  });

  factory SomeRootModel.fromJson(Map<String, dynamic> json) {
    return SomeRootModel(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ArticleResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }


}
