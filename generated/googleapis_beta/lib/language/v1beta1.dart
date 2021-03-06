// This is a generated file (see the discoveryapis_generator project).

library googleapis_beta.language.v1beta1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client language/v1beta1';

/**
 * Google Cloud Natural Language API provides natural language understanding
 * technologies to developers. Examples include sentiment analysis, entity
 * recognition, and text annotations.
 */
class LanguageApi {
  /** View and manage your data across Google Cloud Platform services */
  static const CloudPlatformScope = "https://www.googleapis.com/auth/cloud-platform";


  final commons.ApiRequester _requester;

  DocumentsResourceApi get documents => new DocumentsResourceApi(_requester);

  LanguageApi(http.Client client, {core.String rootUrl: "https://language.googleapis.com/", core.String servicePath: ""}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}


class DocumentsResourceApi {
  final commons.ApiRequester _requester;

  DocumentsResourceApi(commons.ApiRequester client) : 
      _requester = client;

  /**
   * Finds named entities (currently finds proper names) in the text,
   * entity types, salience, mentions for each entity, and other properties.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [AnalyzeEntitiesResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<AnalyzeEntitiesResponse> analyzeEntities(AnalyzeEntitiesRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'v1beta1/documents:analyzeEntities';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new AnalyzeEntitiesResponse.fromJson(data));
  }

  /**
   * Analyzes the sentiment of the provided text.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [AnalyzeSentimentResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<AnalyzeSentimentResponse> analyzeSentiment(AnalyzeSentimentRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'v1beta1/documents:analyzeSentiment';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new AnalyzeSentimentResponse.fromJson(data));
  }

  /**
   * A convenience method that provides all the features that analyzeSentiment,
   * analyzeEntities, and analyzeSyntax provide in one call.
   *
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [AnnotateTextResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<AnnotateTextResponse> annotateText(AnnotateTextRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'v1beta1/documents:annotateText';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new AnnotateTextResponse.fromJson(data));
  }

}



/** The entity analysis request message. */
class AnalyzeEntitiesRequest {
  /** Input document. */
  Document document;
  /**
   * The encoding type used by the API to calculate offsets.
   * Possible string values are:
   * - "NONE" : If `EncodingType` is not specified, encoding-dependent
   * information (such as
   * `begin_offset`) will be set at `-1`.
   * - "UTF8" : Encoding-dependent information (such as `begin_offset`) is
   * calculated based
   * on the UTF-8 encoding of the input. C++ and Go are examples of languages
   * that use this encoding natively.
   * - "UTF16" : Encoding-dependent information (such as `begin_offset`) is
   * calculated based
   * on the UTF-16 encoding of the input. Java and Javascript are examples of
   * languages that use this encoding natively.
   * - "UTF32" : Encoding-dependent information (such as `begin_offset`) is
   * calculated based
   * on the UTF-32 encoding of the input. Python is an example of a language
   * that uses this encoding natively.
   */
  core.String encodingType;

  AnalyzeEntitiesRequest();

  AnalyzeEntitiesRequest.fromJson(core.Map _json) {
    if (_json.containsKey("document")) {
      document = new Document.fromJson(_json["document"]);
    }
    if (_json.containsKey("encodingType")) {
      encodingType = _json["encodingType"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (document != null) {
      _json["document"] = (document).toJson();
    }
    if (encodingType != null) {
      _json["encodingType"] = encodingType;
    }
    return _json;
  }
}

/** The entity analysis response message. */
class AnalyzeEntitiesResponse {
  /** The recognized entities in the input document. */
  core.List<Entity> entities;
  /**
   * The language of the text, which will be the same as the language specified
   * in the request or, if not specified, the automatically-detected language.
   * See Document.language field for more details.
   */
  core.String language;

  AnalyzeEntitiesResponse();

  AnalyzeEntitiesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("entities")) {
      entities = _json["entities"].map((value) => new Entity.fromJson(value)).toList();
    }
    if (_json.containsKey("language")) {
      language = _json["language"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (entities != null) {
      _json["entities"] = entities.map((value) => (value).toJson()).toList();
    }
    if (language != null) {
      _json["language"] = language;
    }
    return _json;
  }
}

/** The sentiment analysis request message. */
class AnalyzeSentimentRequest {
  /**
   * Input document. Currently, `analyzeSentiment` only supports English text
   * (Document.language="EN").
   */
  Document document;

  AnalyzeSentimentRequest();

  AnalyzeSentimentRequest.fromJson(core.Map _json) {
    if (_json.containsKey("document")) {
      document = new Document.fromJson(_json["document"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (document != null) {
      _json["document"] = (document).toJson();
    }
    return _json;
  }
}

/** The sentiment analysis response message. */
class AnalyzeSentimentResponse {
  /** The overall sentiment of the input document. */
  Sentiment documentSentiment;
  /**
   * The language of the text, which will be the same as the language specified
   * in the request or, if not specified, the automatically-detected language.
   */
  core.String language;

  AnalyzeSentimentResponse();

  AnalyzeSentimentResponse.fromJson(core.Map _json) {
    if (_json.containsKey("documentSentiment")) {
      documentSentiment = new Sentiment.fromJson(_json["documentSentiment"]);
    }
    if (_json.containsKey("language")) {
      language = _json["language"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (documentSentiment != null) {
      _json["documentSentiment"] = (documentSentiment).toJson();
    }
    if (language != null) {
      _json["language"] = language;
    }
    return _json;
  }
}

/**
 * The request message for the text annotation API, which can perform multiple
 * analysis types (sentiment, entities, and syntax) in one call.
 */
class AnnotateTextRequest {
  /** Input document. */
  Document document;
  /**
   * The encoding type used by the API to calculate offsets.
   * Possible string values are:
   * - "NONE" : If `EncodingType` is not specified, encoding-dependent
   * information (such as
   * `begin_offset`) will be set at `-1`.
   * - "UTF8" : Encoding-dependent information (such as `begin_offset`) is
   * calculated based
   * on the UTF-8 encoding of the input. C++ and Go are examples of languages
   * that use this encoding natively.
   * - "UTF16" : Encoding-dependent information (such as `begin_offset`) is
   * calculated based
   * on the UTF-16 encoding of the input. Java and Javascript are examples of
   * languages that use this encoding natively.
   * - "UTF32" : Encoding-dependent information (such as `begin_offset`) is
   * calculated based
   * on the UTF-32 encoding of the input. Python is an example of a language
   * that uses this encoding natively.
   */
  core.String encodingType;
  /** The enabled features. */
  Features features;

  AnnotateTextRequest();

  AnnotateTextRequest.fromJson(core.Map _json) {
    if (_json.containsKey("document")) {
      document = new Document.fromJson(_json["document"]);
    }
    if (_json.containsKey("encodingType")) {
      encodingType = _json["encodingType"];
    }
    if (_json.containsKey("features")) {
      features = new Features.fromJson(_json["features"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (document != null) {
      _json["document"] = (document).toJson();
    }
    if (encodingType != null) {
      _json["encodingType"] = encodingType;
    }
    if (features != null) {
      _json["features"] = (features).toJson();
    }
    return _json;
  }
}

/** The text annotations response message. */
class AnnotateTextResponse {
  /**
   * The overall sentiment for the document. Populated if the user enables
   * AnnotateTextRequest.Features.extract_document_sentiment.
   */
  Sentiment documentSentiment;
  /**
   * Entities, along with their semantic information, in the input document.
   * Populated if the user enables
   * AnnotateTextRequest.Features.extract_entities.
   */
  core.List<Entity> entities;
  /**
   * The language of the text, which will be the same as the language specified
   * in the request or, if not specified, the automatically-detected language.
   * See Document.language field for more details.
   */
  core.String language;
  /**
   * Sentences in the input document. Populated if the user enables
   * AnnotateTextRequest.Features.extract_syntax.
   */
  core.List<Sentence> sentences;
  /**
   * Tokens, along with their syntactic information, in the input document.
   * Populated if the user enables
   * AnnotateTextRequest.Features.extract_syntax.
   */
  core.List<Token> tokens;

  AnnotateTextResponse();

  AnnotateTextResponse.fromJson(core.Map _json) {
    if (_json.containsKey("documentSentiment")) {
      documentSentiment = new Sentiment.fromJson(_json["documentSentiment"]);
    }
    if (_json.containsKey("entities")) {
      entities = _json["entities"].map((value) => new Entity.fromJson(value)).toList();
    }
    if (_json.containsKey("language")) {
      language = _json["language"];
    }
    if (_json.containsKey("sentences")) {
      sentences = _json["sentences"].map((value) => new Sentence.fromJson(value)).toList();
    }
    if (_json.containsKey("tokens")) {
      tokens = _json["tokens"].map((value) => new Token.fromJson(value)).toList();
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (documentSentiment != null) {
      _json["documentSentiment"] = (documentSentiment).toJson();
    }
    if (entities != null) {
      _json["entities"] = entities.map((value) => (value).toJson()).toList();
    }
    if (language != null) {
      _json["language"] = language;
    }
    if (sentences != null) {
      _json["sentences"] = sentences.map((value) => (value).toJson()).toList();
    }
    if (tokens != null) {
      _json["tokens"] = tokens.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/** Represents dependency parse tree information for a token. */
class DependencyEdge {
  /**
   * Represents the head of this token in the dependency tree.
   * This is the index of the token which has an arc going to this token.
   * The index is the position of the token in the array of tokens returned
   * by the API method. If this token is a root token, then the
   * `head_token_index` is its own index.
   */
  core.int headTokenIndex;
  /**
   * The parse label for the token.
   * Possible string values are:
   * - "UNKNOWN" : Unknown
   * - "ABBREV" : Abbreviation modifier
   * - "ACOMP" : Adjectival complement
   * - "ADVCL" : Adverbial clause modifier
   * - "ADVMOD" : Adverbial modifier
   * - "AMOD" : Adjectival modifier of an NP
   * - "APPOS" : Appositional modifier of an NP
   * - "ATTR" : Attribute dependent of a copular verb
   * - "AUX" : Auxiliary (non-main) verb
   * - "AUXPASS" : Passive auxiliary
   * - "CC" : Coordinating conjunction
   * - "CCOMP" : Clausal complement of a verb or adjective
   * - "CONJ" : Conjunct
   * - "CSUBJ" : Clausal subject
   * - "CSUBJPASS" : Clausal passive subject
   * - "DEP" : Dependency (unable to determine)
   * - "DET" : Determiner
   * - "DISCOURSE" : Discourse
   * - "DOBJ" : Direct object
   * - "EXPL" : Expletive
   * - "GOESWITH" : Goes with (part of a word in a text not well edited)
   * - "IOBJ" : Indirect object
   * - "MARK" : Marker (word introducing a subordinate clause)
   * - "MWE" : Multi-word expression
   * - "MWV" : Multi-word verbal expression
   * - "NEG" : Negation modifier
   * - "NN" : Noun compound modifier
   * - "NPADVMOD" : Noun phrase used as an adverbial modifier
   * - "NSUBJ" : Nominal subject
   * - "NSUBJPASS" : Passive nominal subject
   * - "NUM" : Numeric modifier of a noun
   * - "NUMBER" : Element of compound number
   * - "P" : Punctuation mark
   * - "PARATAXIS" : Parataxis relation
   * - "PARTMOD" : Participial modifier
   * - "PCOMP" : The complement of a preposition is a clause
   * - "POBJ" : Object of a preposition
   * - "POSS" : Possession modifier
   * - "POSTNEG" : Postverbal negative particle
   * - "PRECOMP" : Predicate complement
   * - "PRECONJ" : Preconjunt
   * - "PREDET" : Predeterminer
   * - "PREF" : Prefix
   * - "PREP" : Prepositional modifier
   * - "PRONL" : The relationship between a verb and verbal morpheme
   * - "PRT" : Particle
   * - "PS" : Associative or possessive marker
   * - "QUANTMOD" : Quantifier phrase modifier
   * - "RCMOD" : Relative clause modifier
   * - "RCMODREL" : Complementizer in relative clause
   * - "RDROP" : Ellipsis without a preceding predicate
   * - "REF" : Referent
   * - "REMNANT" : Remnant
   * - "REPARANDUM" : Reparandum
   * - "ROOT" : Root
   * - "SNUM" : Suffix specifying a unit of number
   * - "SUFF" : Suffix
   * - "TMOD" : Temporal modifier
   * - "TOPIC" : Topic marker
   * - "VMOD" : Clause headed by an infinite form of the verb that modifies a
   * noun
   * - "VOCATIVE" : Vocative
   * - "XCOMP" : Open clausal complement
   * - "SUFFIX" : Name suffix
   * - "TITLE" : Name title
   * - "ADVPHMOD" : Adverbial phrase modifier
   * - "AUXCAUS" : Causative auxiliary
   * - "AUXVV" : Helper auxiliary
   * - "DTMOD" : Rentaishi (Prenominal modifier)
   * - "FOREIGN" : Foreign words
   * - "KW" : Keyword
   * - "LIST" : List for chains of comparable items
   * - "NOMC" : Nominalized clause
   * - "NOMCSUBJ" : Nominalized clausal subject
   * - "NOMCSUBJPASS" : Nominalized clausal passive
   * - "NUMC" : Compound of numeric modifier
   * - "COP" : Copula
   * - "DISLOCATED" : Dislocated relation (for fronted/topicalized elements)
   */
  core.String label;

  DependencyEdge();

  DependencyEdge.fromJson(core.Map _json) {
    if (_json.containsKey("headTokenIndex")) {
      headTokenIndex = _json["headTokenIndex"];
    }
    if (_json.containsKey("label")) {
      label = _json["label"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (headTokenIndex != null) {
      _json["headTokenIndex"] = headTokenIndex;
    }
    if (label != null) {
      _json["label"] = label;
    }
    return _json;
  }
}

/**
 * ################################################################ #
 *
 * Represents the input to API methods.
 */
class Document {
  /** The content of the input in string format. */
  core.String content;
  /** The Google Cloud Storage URI where the file content is located. */
  core.String gcsContentUri;
  /**
   * The language of the document (if not specified, the language is
   * automatically detected). Both ISO and BCP-47 language codes are
   * accepted.<br>
   * **Current Language Restrictions:**
   *
   *  * Only English, Spanish, and Japanese textual content
   *    are supported, with the following additional restriction:
   *    * `analyzeSentiment` only supports English text.
   * If the language (either specified by the caller or automatically detected)
   * is not supported by the called API method, an `INVALID_ARGUMENT` error
   * is returned.
   */
  core.String language;
  /**
   * Required. If the type is not set or is `TYPE_UNSPECIFIED`,
   * returns an `INVALID_ARGUMENT` error.
   * Possible string values are:
   * - "TYPE_UNSPECIFIED" : The content type is not specified.
   * - "PLAIN_TEXT" : Plain text
   * - "HTML" : HTML
   */
  core.String type;

  Document();

  Document.fromJson(core.Map _json) {
    if (_json.containsKey("content")) {
      content = _json["content"];
    }
    if (_json.containsKey("gcsContentUri")) {
      gcsContentUri = _json["gcsContentUri"];
    }
    if (_json.containsKey("language")) {
      language = _json["language"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (content != null) {
      _json["content"] = content;
    }
    if (gcsContentUri != null) {
      _json["gcsContentUri"] = gcsContentUri;
    }
    if (language != null) {
      _json["language"] = language;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/**
 * Represents a phrase in the text that is a known entity, such as
 * a person, an organization, or location. The API associates information, such
 * as salience and mentions, with entities.
 */
class Entity {
  /**
   * The mentions of this entity in the input document. The API currently
   * supports proper noun mentions.
   */
  core.List<EntityMention> mentions;
  /**
   * Metadata associated with the entity.
   *
   * Currently, only Wikipedia URLs are provided, if available.
   * The associated key is "wikipedia_url".
   */
  core.Map<core.String, core.String> metadata;
  /** The representative name for the entity. */
  core.String name;
  /**
   * The salience score associated with the entity in the [0, 1.0] range.
   *
   * The salience score for an entity provides information about the
   * importance or centrality of that entity to the entire document text.
   * Scores closer to 0 are less salient, while scores closer to 1.0 are highly
   * salient.
   */
  core.double salience;
  /**
   * The entity type.
   * Possible string values are:
   * - "UNKNOWN" : Unknown
   * - "PERSON" : Person
   * - "LOCATION" : Location
   * - "ORGANIZATION" : Organization
   * - "EVENT" : Event
   * - "WORK_OF_ART" : Work of art
   * - "CONSUMER_GOOD" : Consumer goods
   * - "OTHER" : Other types
   */
  core.String type;

  Entity();

  Entity.fromJson(core.Map _json) {
    if (_json.containsKey("mentions")) {
      mentions = _json["mentions"].map((value) => new EntityMention.fromJson(value)).toList();
    }
    if (_json.containsKey("metadata")) {
      metadata = _json["metadata"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("salience")) {
      salience = _json["salience"];
    }
    if (_json.containsKey("type")) {
      type = _json["type"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (mentions != null) {
      _json["mentions"] = mentions.map((value) => (value).toJson()).toList();
    }
    if (metadata != null) {
      _json["metadata"] = metadata;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (salience != null) {
      _json["salience"] = salience;
    }
    if (type != null) {
      _json["type"] = type;
    }
    return _json;
  }
}

/**
 * Represents a mention for an entity in the text. Currently, proper noun
 * mentions are supported.
 */
class EntityMention {
  /** The mention text. */
  TextSpan text;

  EntityMention();

  EntityMention.fromJson(core.Map _json) {
    if (_json.containsKey("text")) {
      text = new TextSpan.fromJson(_json["text"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (text != null) {
      _json["text"] = (text).toJson();
    }
    return _json;
  }
}

/**
 * All available features for sentiment, syntax, and semantic analysis.
 * Setting each one to true will enable that specific analysis for the input.
 */
class Features {
  /** Extract document-level sentiment. */
  core.bool extractDocumentSentiment;
  /** Extract entities. */
  core.bool extractEntities;
  /** Extract syntax information. */
  core.bool extractSyntax;

  Features();

  Features.fromJson(core.Map _json) {
    if (_json.containsKey("extractDocumentSentiment")) {
      extractDocumentSentiment = _json["extractDocumentSentiment"];
    }
    if (_json.containsKey("extractEntities")) {
      extractEntities = _json["extractEntities"];
    }
    if (_json.containsKey("extractSyntax")) {
      extractSyntax = _json["extractSyntax"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (extractDocumentSentiment != null) {
      _json["extractDocumentSentiment"] = extractDocumentSentiment;
    }
    if (extractEntities != null) {
      _json["extractEntities"] = extractEntities;
    }
    if (extractSyntax != null) {
      _json["extractSyntax"] = extractSyntax;
    }
    return _json;
  }
}

/** Represents part of speech information for a token. */
class PartOfSpeech {
  /**
   * The part of speech tag.
   * Possible string values are:
   * - "UNKNOWN" : Unknown
   * - "ADJ" : Adjective
   * - "ADP" : Adposition (preposition and postposition)
   * - "ADV" : Adverb
   * - "CONJ" : Conjunction
   * - "DET" : Determiner
   * - "NOUN" : Noun (common and proper)
   * - "NUM" : Cardinal number
   * - "PRON" : Pronoun
   * - "PRT" : Particle or other function word
   * - "PUNCT" : Punctuation
   * - "VERB" : Verb (all tenses and modes)
   * - "X" : Other: foreign words, typos, abbreviations
   * - "AFFIX" : Affix
   */
  core.String tag;

  PartOfSpeech();

  PartOfSpeech.fromJson(core.Map _json) {
    if (_json.containsKey("tag")) {
      tag = _json["tag"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (tag != null) {
      _json["tag"] = tag;
    }
    return _json;
  }
}

/** Represents a sentence in the input document. */
class Sentence {
  /** The sentence text. */
  TextSpan text;

  Sentence();

  Sentence.fromJson(core.Map _json) {
    if (_json.containsKey("text")) {
      text = new TextSpan.fromJson(_json["text"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (text != null) {
      _json["text"] = (text).toJson();
    }
    return _json;
  }
}

/**
 * Represents the feeling associated with the entire text or entities in
 * the text.
 */
class Sentiment {
  /**
   * A non-negative number in the [0, +inf) range, which represents
   * the absolute magnitude of sentiment regardless of polarity (positive or
   * negative).
   */
  core.double magnitude;
  /**
   * DEPRECATED FIELD - This field is being deprecated in
   * favor of score. Please refer to our documentation at
   * https://cloud.google.com/natural-language/docs for more information.
   */
  core.double polarity;

  Sentiment();

  Sentiment.fromJson(core.Map _json) {
    if (_json.containsKey("magnitude")) {
      magnitude = _json["magnitude"];
    }
    if (_json.containsKey("polarity")) {
      polarity = _json["polarity"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (magnitude != null) {
      _json["magnitude"] = magnitude;
    }
    if (polarity != null) {
      _json["polarity"] = polarity;
    }
    return _json;
  }
}

/**
 * The `Status` type defines a logical error model that is suitable for
 * different
 * programming environments, including REST APIs and RPC APIs. It is used by
 * [gRPC](https://github.com/grpc). The error model is designed to be:
 *
 * - Simple to use and understand for most users
 * - Flexible enough to meet unexpected needs
 *
 * # Overview
 *
 * The `Status` message contains three pieces of data: error code, error
 * message,
 * and error details. The error code should be an enum value of
 * google.rpc.Code, but it may accept additional error codes if needed.  The
 * error message should be a developer-facing English message that helps
 * developers *understand* and *resolve* the error. If a localized user-facing
 * error message is needed, put the localized message in the error details or
 * localize it in the client. The optional error details may contain arbitrary
 * information about the error. There is a predefined set of error detail types
 * in the package `google.rpc` which can be used for common error conditions.
 *
 * # Language mapping
 *
 * The `Status` message is the logical representation of the error model, but it
 * is not necessarily the actual wire format. When the `Status` message is
 * exposed in different client libraries and different wire protocols, it can be
 * mapped differently. For example, it will likely be mapped to some exceptions
 * in Java, but more likely mapped to some error codes in C.
 *
 * # Other uses
 *
 * The error model and the `Status` message can be used in a variety of
 * environments, either with or without APIs, to provide a
 * consistent developer experience across different environments.
 *
 * Example uses of this error model include:
 *
 * - Partial errors. If a service needs to return partial errors to the client,
 *     it may embed the `Status` in the normal response to indicate the partial
 *     errors.
 *
 * - Workflow errors. A typical workflow has multiple steps. Each step may
 *     have a `Status` message for error reporting purpose.
 *
 * - Batch operations. If a client uses batch request and batch response, the
 *     `Status` message should be used directly inside batch response, one for
 *     each error sub-response.
 *
 * - Asynchronous operations. If an API call embeds asynchronous operation
 *     results in its response, the status of those operations should be
 *     represented directly using the `Status` message.
 *
 * - Logging. If some API errors are stored in logs, the message `Status` could
 * be used directly after any stripping needed for security/privacy reasons.
 */
class Status {
  /** The status code, which should be an enum value of google.rpc.Code. */
  core.int code;
  /**
   * A list of messages that carry the error details.  There will be a
   * common set of message types for APIs to use.
   *
   * The values for Object must be JSON objects. It can consist of `num`,
   * `String`, `bool` and `null` as well as `Map` and `List` values.
   */
  core.List<core.Map<core.String, core.Object>> details;
  /**
   * A developer-facing error message, which should be in English. Any
   * user-facing error message should be localized and sent in the
   * google.rpc.Status.details field, or localized by the client.
   */
  core.String message;

  Status();

  Status.fromJson(core.Map _json) {
    if (_json.containsKey("code")) {
      code = _json["code"];
    }
    if (_json.containsKey("details")) {
      details = _json["details"];
    }
    if (_json.containsKey("message")) {
      message = _json["message"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (code != null) {
      _json["code"] = code;
    }
    if (details != null) {
      _json["details"] = details;
    }
    if (message != null) {
      _json["message"] = message;
    }
    return _json;
  }
}

/** Represents an output piece of text. */
class TextSpan {
  /**
   * The API calculates the beginning offset of the content in the original
   * document according to the EncodingType specified in the API request.
   */
  core.int beginOffset;
  /** The content of the output text. */
  core.String content;

  TextSpan();

  TextSpan.fromJson(core.Map _json) {
    if (_json.containsKey("beginOffset")) {
      beginOffset = _json["beginOffset"];
    }
    if (_json.containsKey("content")) {
      content = _json["content"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (beginOffset != null) {
      _json["beginOffset"] = beginOffset;
    }
    if (content != null) {
      _json["content"] = content;
    }
    return _json;
  }
}

/** Represents the smallest syntactic building block of the text. */
class Token {
  /** Dependency tree parse for this token. */
  DependencyEdge dependencyEdge;
  /**
   * [Lemma](https://en.wikipedia.org/wiki/Lemma_(morphology))
   * of the token.
   */
  core.String lemma;
  /** Parts of speech tag for this token. */
  PartOfSpeech partOfSpeech;
  /** The token text. */
  TextSpan text;

  Token();

  Token.fromJson(core.Map _json) {
    if (_json.containsKey("dependencyEdge")) {
      dependencyEdge = new DependencyEdge.fromJson(_json["dependencyEdge"]);
    }
    if (_json.containsKey("lemma")) {
      lemma = _json["lemma"];
    }
    if (_json.containsKey("partOfSpeech")) {
      partOfSpeech = new PartOfSpeech.fromJson(_json["partOfSpeech"]);
    }
    if (_json.containsKey("text")) {
      text = new TextSpan.fromJson(_json["text"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (dependencyEdge != null) {
      _json["dependencyEdge"] = (dependencyEdge).toJson();
    }
    if (lemma != null) {
      _json["lemma"] = lemma;
    }
    if (partOfSpeech != null) {
      _json["partOfSpeech"] = (partOfSpeech).toJson();
    }
    if (text != null) {
      _json["text"] = (text).toJson();
    }
    return _json;
  }
}
