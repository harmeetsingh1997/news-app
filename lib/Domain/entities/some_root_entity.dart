
class MediaEntity {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approvedForSyndication;
  final List<MediaMetadataEntity>? mediaMetadata;

  MediaEntity({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });
}

class MediaMetadataEntity {
  final String? url;
  final String? format;
  final int? height;
  final int? width;

  MediaMetadataEntity({
    this.url,
    this.format,
    this.height,
    this.width,
  });
}

class ArticleResultEntity {
  final String? uri;
  final String? url;
  final int? id;
  final int? assetId;
  final String? source;
  final String? publishedDate;
  final String? updated;
  final String? section;
  final String? subsection;
  final String? nytdsection;
  final String? adxKeywords;
  final String? column;
  final String? byline;
  final String? type;
  final String? title;
  final String? abstractText;
  final List<String>? desFacet;
  final List<String>? orgFacet;
  final List<String>? perFacet;
  final List<String>? geoFacet;
  final List<MediaEntity>? media;
  final int? etaId;

  ArticleResultEntity({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.abstractText,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });
}

class SomeRootEntity {
  final String? status;
  final String? copyright;
  final int? numResults;
  final List<ArticleResultEntity>? results;

  SomeRootEntity({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });
}
