
class NewsEntity {
  final String? status;
  final String? copyright;
  final String? section;
  final String? lastUpdated;
  final int? numResults;
  final List<ResultEntity>? results;

  NewsEntity({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });
}

class ResultEntity {
  final String? section;
  final String? subsection;
  final String? title;
  final String? abstract;
  final String? url;
  final String? uri;
  final String? byline;
  final String? itemType;
  final String? updatedDate;
  final String? createdDate;
  final String? publishedDate;
  final String? materialTypeFacet;
  final String? kicker;
  final List<String>? desFacet;
  final List<String>? orgFacet;
  final List<String>? perFacet;
  final List<String>? geoFacet;
  final List<MultimediaEntity>? multimedia;
  final String? shortUrl;

  ResultEntity({
    this.section,
    this.subsection,
    this.title,
    this.abstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });
}

class MultimediaEntity {
  final String? url;
  final String? format;
  final int? height;
  final int? width;
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;

  MultimediaEntity({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });
}
