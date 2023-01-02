import 'dart:convert';
PersonsResponse personsResponseFromJson(String str) => PersonsResponse.fromJson(json.decode(str));
String personsResponseToJson(PersonsResponse data) => json.encode(data.toJson());
class PersonsResponse {
  PersonsResponse({
      num? page, 
      List<PersonsResults>? results,
      num? totalPages, 
      num? totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  PersonsResponse.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(PersonsResults.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  num? _page;
  List<PersonsResults>? _results;
  num? _totalPages;
  num? _totalResults;

  num get page => _page ?? 0;
  List<PersonsResults> get results => _results ?? [];
  num get totalPages => _totalPages??0;
  num? get totalResults => _totalResults??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}

PersonsResults resultsFromJson(String str) => PersonsResults.fromJson(json.decode(str));
String resultsToJson(PersonsResults data) => json.encode(data.toJson());
class PersonsResults {
  PersonsResults({
      bool? adult, 
      num? gender, 
      num? id, 
      List<KnownFor>? knownFor, 
      String? knownForDepartment, 
      String? name, 
      num? popularity, 
      String? profilePath,}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownFor = knownFor;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _popularity = popularity;
    _profilePath = profilePath;
}

  PersonsResults.fromJson(dynamic json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    if (json['known_for'] != null) {
      _knownFor = [];
      json['known_for'].forEach((v) {
        _knownFor?.add(KnownFor.fromJson(v));
      });
    }
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
  }
  bool? _adult;
  num? _gender;
  num? _id;
  List<KnownFor>? _knownFor;
  String? _knownForDepartment;
  String? _name;
  num? _popularity;
  String? _profilePath;

  bool get adult => _adult ?? false;
  num get gender => _gender ?? 0;
  num get id => _id ?? 0;
  List<KnownFor> get knownFor => _knownFor ?? [];
  String get knownForDepartment => _knownForDepartment ?? '';
  String get name => _name ?? '';
  num get popularity => _popularity ?? 0;
  String get profilePath => _profilePath ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['gender'] = _gender;
    map['id'] = _id;
    if (_knownFor != null) {
      map['known_for'] = _knownFor?.map((v) => v.toJson()).toList();
    }
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    return map;
  }

}

KnownFor knownForFromJson(String str) => KnownFor.fromJson(json.decode(str));
String knownForToJson(KnownFor data) => json.encode(data.toJson());
class KnownFor {
  KnownFor({
      String? backdropPath, 
      String? firstAirDate, 
      List<num>? genreIds, 
      num? id, 
      String? mediaType, 
      String? name, 
      List<String>? originCountry, 
      String? originalLanguage, 
      String? originalName, 
      String? overview, 
      String? posterPath, 
      num? voteAverage, 
      num? voteCount,}){
    _backdropPath = backdropPath;
    _firstAirDate = firstAirDate;
    _genreIds = genreIds;
    _id = id;
    _mediaType = mediaType;
    _name = name;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _posterPath = posterPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  KnownFor.fromJson(dynamic json) {
    _backdropPath = json['backdrop_path'];
    _firstAirDate = json['first_air_date'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _mediaType = json['media_type'];
    _name = json['name'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  String? _backdropPath;
  String? _firstAirDate;
  List<num>? _genreIds;
  num? _id;
  String? _mediaType;
  String? _name;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  String? _posterPath;
  num? _voteAverage;
  num? _voteCount;

  String get mediaType => _mediaType ?? '';
  String get backdropPath => _backdropPath ?? '';
  String get firstAirDate => _firstAirDate ?? '';
  List<num> get genreIds => _genreIds ?? [];
  num get id => _id ?? 0;
  String get name => _name ?? '';
  List<String> get originCountry => _originCountry ?? [];
  String get originalLanguage => _originalLanguage ?? '';
  String get originalName => _originalName ?? '';
  String get overview => _overview ?? '';
  String get posterPath => _posterPath ?? '';
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = _backdropPath;
    map['first_air_date'] = _firstAirDate;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['media_type'] = _mediaType;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}