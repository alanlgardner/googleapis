library googleapis.adsensehost.v4_1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/adsensehost/v4_1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterAccount = 0;
buildAccount() {
  var o = new api.Account();
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.status = "foo";
  }
  buildCounterAccount--;
  return o;
}

checkAccount(api.Account o) {
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterAccount--;
}

buildUnnamed3117() {
  var o = new core.List<api.Account>();
  o.add(buildAccount());
  o.add(buildAccount());
  return o;
}

checkUnnamed3117(core.List<api.Account> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccount(o[0]);
  checkAccount(o[1]);
}

core.int buildCounterAccounts = 0;
buildAccounts() {
  var o = new api.Accounts();
  buildCounterAccounts++;
  if (buildCounterAccounts < 3) {
    o.etag = "foo";
    o.items = buildUnnamed3117();
    o.kind = "foo";
  }
  buildCounterAccounts--;
  return o;
}

checkAccounts(api.Accounts o) {
  buildCounterAccounts++;
  if (buildCounterAccounts < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3117(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterAccounts--;
}

core.int buildCounterAdClient = 0;
buildAdClient() {
  var o = new api.AdClient();
  buildCounterAdClient++;
  if (buildCounterAdClient < 3) {
    o.arcOptIn = true;
    o.id = "foo";
    o.kind = "foo";
    o.productCode = "foo";
    o.supportsReporting = true;
  }
  buildCounterAdClient--;
  return o;
}

checkAdClient(api.AdClient o) {
  buildCounterAdClient++;
  if (buildCounterAdClient < 3) {
    unittest.expect(o.arcOptIn, unittest.isTrue);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.productCode, unittest.equals('foo'));
    unittest.expect(o.supportsReporting, unittest.isTrue);
  }
  buildCounterAdClient--;
}

buildUnnamed3118() {
  var o = new core.List<api.AdClient>();
  o.add(buildAdClient());
  o.add(buildAdClient());
  return o;
}

checkUnnamed3118(core.List<api.AdClient> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdClient(o[0]);
  checkAdClient(o[1]);
}

core.int buildCounterAdClients = 0;
buildAdClients() {
  var o = new api.AdClients();
  buildCounterAdClients++;
  if (buildCounterAdClients < 3) {
    o.etag = "foo";
    o.items = buildUnnamed3118();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAdClients--;
  return o;
}

checkAdClients(api.AdClients o) {
  buildCounterAdClients++;
  if (buildCounterAdClients < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3118(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAdClients--;
}

core.int buildCounterAdCode = 0;
buildAdCode() {
  var o = new api.AdCode();
  buildCounterAdCode++;
  if (buildCounterAdCode < 3) {
    o.adCode = "foo";
    o.kind = "foo";
  }
  buildCounterAdCode--;
  return o;
}

checkAdCode(api.AdCode o) {
  buildCounterAdCode++;
  if (buildCounterAdCode < 3) {
    unittest.expect(o.adCode, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterAdCode--;
}

core.int buildCounterAdStyleColors = 0;
buildAdStyleColors() {
  var o = new api.AdStyleColors();
  buildCounterAdStyleColors++;
  if (buildCounterAdStyleColors < 3) {
    o.background = "foo";
    o.border = "foo";
    o.text = "foo";
    o.title = "foo";
    o.url = "foo";
  }
  buildCounterAdStyleColors--;
  return o;
}

checkAdStyleColors(api.AdStyleColors o) {
  buildCounterAdStyleColors++;
  if (buildCounterAdStyleColors < 3) {
    unittest.expect(o.background, unittest.equals('foo'));
    unittest.expect(o.border, unittest.equals('foo'));
    unittest.expect(o.text, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterAdStyleColors--;
}

core.int buildCounterAdStyleFont = 0;
buildAdStyleFont() {
  var o = new api.AdStyleFont();
  buildCounterAdStyleFont++;
  if (buildCounterAdStyleFont < 3) {
    o.family = "foo";
    o.size = "foo";
  }
  buildCounterAdStyleFont--;
  return o;
}

checkAdStyleFont(api.AdStyleFont o) {
  buildCounterAdStyleFont++;
  if (buildCounterAdStyleFont < 3) {
    unittest.expect(o.family, unittest.equals('foo'));
    unittest.expect(o.size, unittest.equals('foo'));
  }
  buildCounterAdStyleFont--;
}

core.int buildCounterAdStyle = 0;
buildAdStyle() {
  var o = new api.AdStyle();
  buildCounterAdStyle++;
  if (buildCounterAdStyle < 3) {
    o.colors = buildAdStyleColors();
    o.corners = "foo";
    o.font = buildAdStyleFont();
    o.kind = "foo";
  }
  buildCounterAdStyle--;
  return o;
}

checkAdStyle(api.AdStyle o) {
  buildCounterAdStyle++;
  if (buildCounterAdStyle < 3) {
    checkAdStyleColors(o.colors);
    unittest.expect(o.corners, unittest.equals('foo'));
    checkAdStyleFont(o.font);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterAdStyle--;
}

core.int buildCounterAdUnitContentAdsSettingsBackupOption = 0;
buildAdUnitContentAdsSettingsBackupOption() {
  var o = new api.AdUnitContentAdsSettingsBackupOption();
  buildCounterAdUnitContentAdsSettingsBackupOption++;
  if (buildCounterAdUnitContentAdsSettingsBackupOption < 3) {
    o.color = "foo";
    o.type = "foo";
    o.url = "foo";
  }
  buildCounterAdUnitContentAdsSettingsBackupOption--;
  return o;
}

checkAdUnitContentAdsSettingsBackupOption(api.AdUnitContentAdsSettingsBackupOption o) {
  buildCounterAdUnitContentAdsSettingsBackupOption++;
  if (buildCounterAdUnitContentAdsSettingsBackupOption < 3) {
    unittest.expect(o.color, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterAdUnitContentAdsSettingsBackupOption--;
}

core.int buildCounterAdUnitContentAdsSettings = 0;
buildAdUnitContentAdsSettings() {
  var o = new api.AdUnitContentAdsSettings();
  buildCounterAdUnitContentAdsSettings++;
  if (buildCounterAdUnitContentAdsSettings < 3) {
    o.backupOption = buildAdUnitContentAdsSettingsBackupOption();
    o.size = "foo";
    o.type = "foo";
  }
  buildCounterAdUnitContentAdsSettings--;
  return o;
}

checkAdUnitContentAdsSettings(api.AdUnitContentAdsSettings o) {
  buildCounterAdUnitContentAdsSettings++;
  if (buildCounterAdUnitContentAdsSettings < 3) {
    checkAdUnitContentAdsSettingsBackupOption(o.backupOption);
    unittest.expect(o.size, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAdUnitContentAdsSettings--;
}

core.int buildCounterAdUnitMobileContentAdsSettings = 0;
buildAdUnitMobileContentAdsSettings() {
  var o = new api.AdUnitMobileContentAdsSettings();
  buildCounterAdUnitMobileContentAdsSettings++;
  if (buildCounterAdUnitMobileContentAdsSettings < 3) {
    o.markupLanguage = "foo";
    o.scriptingLanguage = "foo";
    o.size = "foo";
    o.type = "foo";
  }
  buildCounterAdUnitMobileContentAdsSettings--;
  return o;
}

checkAdUnitMobileContentAdsSettings(api.AdUnitMobileContentAdsSettings o) {
  buildCounterAdUnitMobileContentAdsSettings++;
  if (buildCounterAdUnitMobileContentAdsSettings < 3) {
    unittest.expect(o.markupLanguage, unittest.equals('foo'));
    unittest.expect(o.scriptingLanguage, unittest.equals('foo'));
    unittest.expect(o.size, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAdUnitMobileContentAdsSettings--;
}

core.int buildCounterAdUnit = 0;
buildAdUnit() {
  var o = new api.AdUnit();
  buildCounterAdUnit++;
  if (buildCounterAdUnit < 3) {
    o.code = "foo";
    o.contentAdsSettings = buildAdUnitContentAdsSettings();
    o.customStyle = buildAdStyle();
    o.id = "foo";
    o.kind = "foo";
    o.mobileContentAdsSettings = buildAdUnitMobileContentAdsSettings();
    o.name = "foo";
    o.status = "foo";
  }
  buildCounterAdUnit--;
  return o;
}

checkAdUnit(api.AdUnit o) {
  buildCounterAdUnit++;
  if (buildCounterAdUnit < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkAdUnitContentAdsSettings(o.contentAdsSettings);
    checkAdStyle(o.customStyle);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkAdUnitMobileContentAdsSettings(o.mobileContentAdsSettings);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterAdUnit--;
}

buildUnnamed3119() {
  var o = new core.List<api.AdUnit>();
  o.add(buildAdUnit());
  o.add(buildAdUnit());
  return o;
}

checkUnnamed3119(core.List<api.AdUnit> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAdUnit(o[0]);
  checkAdUnit(o[1]);
}

core.int buildCounterAdUnits = 0;
buildAdUnits() {
  var o = new api.AdUnits();
  buildCounterAdUnits++;
  if (buildCounterAdUnits < 3) {
    o.etag = "foo";
    o.items = buildUnnamed3119();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterAdUnits--;
  return o;
}

checkAdUnits(api.AdUnits o) {
  buildCounterAdUnits++;
  if (buildCounterAdUnits < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3119(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterAdUnits--;
}

buildUnnamed3120() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3120(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAssociationSession = 0;
buildAssociationSession() {
  var o = new api.AssociationSession();
  buildCounterAssociationSession++;
  if (buildCounterAssociationSession < 3) {
    o.accountId = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.productCodes = buildUnnamed3120();
    o.redirectUrl = "foo";
    o.status = "foo";
    o.userLocale = "foo";
    o.websiteLocale = "foo";
    o.websiteUrl = "foo";
  }
  buildCounterAssociationSession--;
  return o;
}

checkAssociationSession(api.AssociationSession o) {
  buildCounterAssociationSession++;
  if (buildCounterAssociationSession < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3120(o.productCodes);
    unittest.expect(o.redirectUrl, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.userLocale, unittest.equals('foo'));
    unittest.expect(o.websiteLocale, unittest.equals('foo'));
    unittest.expect(o.websiteUrl, unittest.equals('foo'));
  }
  buildCounterAssociationSession--;
}

core.int buildCounterCustomChannel = 0;
buildCustomChannel() {
  var o = new api.CustomChannel();
  buildCounterCustomChannel++;
  if (buildCounterCustomChannel < 3) {
    o.code = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
  }
  buildCounterCustomChannel--;
  return o;
}

checkCustomChannel(api.CustomChannel o) {
  buildCounterCustomChannel++;
  if (buildCounterCustomChannel < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterCustomChannel--;
}

buildUnnamed3121() {
  var o = new core.List<api.CustomChannel>();
  o.add(buildCustomChannel());
  o.add(buildCustomChannel());
  return o;
}

checkUnnamed3121(core.List<api.CustomChannel> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomChannel(o[0]);
  checkCustomChannel(o[1]);
}

core.int buildCounterCustomChannels = 0;
buildCustomChannels() {
  var o = new api.CustomChannels();
  buildCounterCustomChannels++;
  if (buildCounterCustomChannels < 3) {
    o.etag = "foo";
    o.items = buildUnnamed3121();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterCustomChannels--;
  return o;
}

checkCustomChannels(api.CustomChannels o) {
  buildCounterCustomChannels++;
  if (buildCounterCustomChannels < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3121(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterCustomChannels--;
}

buildUnnamed3122() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3122(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReportHeaders = 0;
buildReportHeaders() {
  var o = new api.ReportHeaders();
  buildCounterReportHeaders++;
  if (buildCounterReportHeaders < 3) {
    o.currency = "foo";
    o.name = "foo";
    o.type = "foo";
  }
  buildCounterReportHeaders--;
  return o;
}

checkReportHeaders(api.ReportHeaders o) {
  buildCounterReportHeaders++;
  if (buildCounterReportHeaders < 3) {
    unittest.expect(o.currency, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterReportHeaders--;
}

buildUnnamed3123() {
  var o = new core.List<api.ReportHeaders>();
  o.add(buildReportHeaders());
  o.add(buildReportHeaders());
  return o;
}

checkUnnamed3123(core.List<api.ReportHeaders> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReportHeaders(o[0]);
  checkReportHeaders(o[1]);
}

buildUnnamed3124() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3124(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3125() {
  var o = new core.List<core.List<core.String>>();
  o.add(buildUnnamed3124());
  o.add(buildUnnamed3124());
  return o;
}

checkUnnamed3125(core.List<core.List<core.String>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed3124(o[0]);
  checkUnnamed3124(o[1]);
}

buildUnnamed3126() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3126(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3127() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3127(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReport = 0;
buildReport() {
  var o = new api.Report();
  buildCounterReport++;
  if (buildCounterReport < 3) {
    o.averages = buildUnnamed3122();
    o.headers = buildUnnamed3123();
    o.kind = "foo";
    o.rows = buildUnnamed3125();
    o.totalMatchedRows = "foo";
    o.totals = buildUnnamed3126();
    o.warnings = buildUnnamed3127();
  }
  buildCounterReport--;
  return o;
}

checkReport(api.Report o) {
  buildCounterReport++;
  if (buildCounterReport < 3) {
    checkUnnamed3122(o.averages);
    checkUnnamed3123(o.headers);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed3125(o.rows);
    unittest.expect(o.totalMatchedRows, unittest.equals('foo'));
    checkUnnamed3126(o.totals);
    checkUnnamed3127(o.warnings);
  }
  buildCounterReport--;
}

core.int buildCounterUrlChannel = 0;
buildUrlChannel() {
  var o = new api.UrlChannel();
  buildCounterUrlChannel++;
  if (buildCounterUrlChannel < 3) {
    o.id = "foo";
    o.kind = "foo";
    o.urlPattern = "foo";
  }
  buildCounterUrlChannel--;
  return o;
}

checkUrlChannel(api.UrlChannel o) {
  buildCounterUrlChannel++;
  if (buildCounterUrlChannel < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.urlPattern, unittest.equals('foo'));
  }
  buildCounterUrlChannel--;
}

buildUnnamed3128() {
  var o = new core.List<api.UrlChannel>();
  o.add(buildUrlChannel());
  o.add(buildUrlChannel());
  return o;
}

checkUnnamed3128(core.List<api.UrlChannel> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUrlChannel(o[0]);
  checkUrlChannel(o[1]);
}

core.int buildCounterUrlChannels = 0;
buildUrlChannels() {
  var o = new api.UrlChannels();
  buildCounterUrlChannels++;
  if (buildCounterUrlChannels < 3) {
    o.etag = "foo";
    o.items = buildUnnamed3128();
    o.kind = "foo";
    o.nextPageToken = "foo";
  }
  buildCounterUrlChannels--;
  return o;
}

checkUrlChannels(api.UrlChannels o) {
  buildCounterUrlChannels++;
  if (buildCounterUrlChannels < 3) {
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed3128(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterUrlChannels--;
}

buildUnnamed3129() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3129(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3130() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3130(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3131() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3131(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3132() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3132(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3133() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3133(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3134() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3134(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3135() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3135(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3136() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3136(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3137() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3137(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3138() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3138(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3139() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3139(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}


main() {
  unittest.group("obj-schema-Account", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccount();
      var od = new api.Account.fromJson(o.toJson());
      checkAccount(od);
    });
  });


  unittest.group("obj-schema-Accounts", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccounts();
      var od = new api.Accounts.fromJson(o.toJson());
      checkAccounts(od);
    });
  });


  unittest.group("obj-schema-AdClient", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdClient();
      var od = new api.AdClient.fromJson(o.toJson());
      checkAdClient(od);
    });
  });


  unittest.group("obj-schema-AdClients", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdClients();
      var od = new api.AdClients.fromJson(o.toJson());
      checkAdClients(od);
    });
  });


  unittest.group("obj-schema-AdCode", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdCode();
      var od = new api.AdCode.fromJson(o.toJson());
      checkAdCode(od);
    });
  });


  unittest.group("obj-schema-AdStyleColors", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdStyleColors();
      var od = new api.AdStyleColors.fromJson(o.toJson());
      checkAdStyleColors(od);
    });
  });


  unittest.group("obj-schema-AdStyleFont", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdStyleFont();
      var od = new api.AdStyleFont.fromJson(o.toJson());
      checkAdStyleFont(od);
    });
  });


  unittest.group("obj-schema-AdStyle", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdStyle();
      var od = new api.AdStyle.fromJson(o.toJson());
      checkAdStyle(od);
    });
  });


  unittest.group("obj-schema-AdUnitContentAdsSettingsBackupOption", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdUnitContentAdsSettingsBackupOption();
      var od = new api.AdUnitContentAdsSettingsBackupOption.fromJson(o.toJson());
      checkAdUnitContentAdsSettingsBackupOption(od);
    });
  });


  unittest.group("obj-schema-AdUnitContentAdsSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdUnitContentAdsSettings();
      var od = new api.AdUnitContentAdsSettings.fromJson(o.toJson());
      checkAdUnitContentAdsSettings(od);
    });
  });


  unittest.group("obj-schema-AdUnitMobileContentAdsSettings", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdUnitMobileContentAdsSettings();
      var od = new api.AdUnitMobileContentAdsSettings.fromJson(o.toJson());
      checkAdUnitMobileContentAdsSettings(od);
    });
  });


  unittest.group("obj-schema-AdUnit", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdUnit();
      var od = new api.AdUnit.fromJson(o.toJson());
      checkAdUnit(od);
    });
  });


  unittest.group("obj-schema-AdUnits", () {
    unittest.test("to-json--from-json", () {
      var o = buildAdUnits();
      var od = new api.AdUnits.fromJson(o.toJson());
      checkAdUnits(od);
    });
  });


  unittest.group("obj-schema-AssociationSession", () {
    unittest.test("to-json--from-json", () {
      var o = buildAssociationSession();
      var od = new api.AssociationSession.fromJson(o.toJson());
      checkAssociationSession(od);
    });
  });


  unittest.group("obj-schema-CustomChannel", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomChannel();
      var od = new api.CustomChannel.fromJson(o.toJson());
      checkCustomChannel(od);
    });
  });


  unittest.group("obj-schema-CustomChannels", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomChannels();
      var od = new api.CustomChannels.fromJson(o.toJson());
      checkCustomChannels(od);
    });
  });


  unittest.group("obj-schema-ReportHeaders", () {
    unittest.test("to-json--from-json", () {
      var o = buildReportHeaders();
      var od = new api.ReportHeaders.fromJson(o.toJson());
      checkReportHeaders(od);
    });
  });


  unittest.group("obj-schema-Report", () {
    unittest.test("to-json--from-json", () {
      var o = buildReport();
      var od = new api.Report.fromJson(o.toJson());
      checkReport(od);
    });
  });


  unittest.group("obj-schema-UrlChannel", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlChannel();
      var od = new api.UrlChannel.fromJson(o.toJson());
      checkUrlChannel(od);
    });
  });


  unittest.group("obj-schema-UrlChannels", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlChannels();
      var od = new api.UrlChannels.fromJson(o.toJson());
      checkUrlChannels(od);
    });
  });


  unittest.group("resource-AccountsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.AdsensehostApi(mock).accounts;
      var arg_accountId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId).then(unittest.expectAsync(((api.Account response) {
        checkAccount(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.AdsensehostApi(mock).accounts;
      var arg_filterAdClientId = buildUnnamed3129();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("accounts"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filterAdClientId"], unittest.equals(arg_filterAdClientId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAccounts());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_filterAdClientId).then(unittest.expectAsync(((api.Accounts response) {
        checkAccounts(response);
      })));
    });

  });


  unittest.group("resource-AccountsAdclientsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsAdclientsResourceApi res = new api.AdsensehostApi(mock).accounts.adclients;
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdClient());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_adClientId).then(unittest.expectAsync(((api.AdClient response) {
        checkAdClient(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsAdclientsResourceApi res = new api.AdsensehostApi(mock).accounts.adclients;
      var arg_accountId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/adclients"));
        pathOffset += 10;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdClients());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AdClients response) {
        checkAdClients(response);
      })));
    });

  });


  unittest.group("resource-AccountsAdunitsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      var arg_adUnitId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/adunits/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_adUnitId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdUnit());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_adClientId, arg_adUnitId).then(unittest.expectAsync(((api.AdUnit response) {
        checkAdUnit(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      var arg_adUnitId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/adunits/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_adUnitId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdUnit());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_adClientId, arg_adUnitId).then(unittest.expectAsync(((api.AdUnit response) {
        checkAdUnit(response);
      })));
    });

    unittest.test("method--getAdCode", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      var arg_adUnitId = "foo";
      var arg_hostCustomChannelId = buildUnnamed3130();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/adunits/"));
        pathOffset += 9;
        index = path.indexOf("/adcode", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adUnitId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/adcode"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["hostCustomChannelId"], unittest.equals(arg_hostCustomChannelId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdCode());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getAdCode(arg_accountId, arg_adClientId, arg_adUnitId, hostCustomChannelId: arg_hostCustomChannelId).then(unittest.expectAsync(((api.AdCode response) {
        checkAdCode(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_request = buildAdUnit();
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AdUnit.fromJson(json);
        checkAdUnit(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/adunits"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdUnit());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_accountId, arg_adClientId).then(unittest.expectAsync(((api.AdUnit response) {
        checkAdUnit(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      var arg_includeInactive = true;
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/adunits"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["includeInactive"].first, unittest.equals("$arg_includeInactive"));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdUnits());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_adClientId, includeInactive: arg_includeInactive, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AdUnits response) {
        checkAdUnits(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_request = buildAdUnit();
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      var arg_adUnitId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AdUnit.fromJson(json);
        checkAdUnit(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/adunits"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["adUnitId"].first, unittest.equals(arg_adUnitId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdUnit());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_accountId, arg_adClientId, arg_adUnitId).then(unittest.expectAsync(((api.AdUnit response) {
        checkAdUnit(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsAdunitsResourceApi res = new api.AdsensehostApi(mock).accounts.adunits;
      var arg_request = buildAdUnit();
      var arg_accountId = "foo";
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AdUnit.fromJson(json);
        checkAdUnit(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/adclients/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/adclients/"));
        pathOffset += 11;
        index = path.indexOf("/adunits", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/adunits"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdUnit());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_adClientId).then(unittest.expectAsync(((api.AdUnit response) {
        checkAdUnit(response);
      })));
    });

  });


  unittest.group("resource-AccountsReportsResourceApi", () {
    unittest.test("method--generate", () {

      var mock = new HttpServerMock();
      api.AccountsReportsResourceApi res = new api.AdsensehostApi(mock).accounts.reports;
      var arg_accountId = "foo";
      var arg_startDate = "foo";
      var arg_endDate = "foo";
      var arg_dimension = buildUnnamed3131();
      var arg_filter = buildUnnamed3132();
      var arg_locale = "foo";
      var arg_maxResults = 42;
      var arg_metric = buildUnnamed3133();
      var arg_sort = buildUnnamed3134();
      var arg_startIndex = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/reports", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/reports"));
        pathOffset += 8;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["startDate"].first, unittest.equals(arg_startDate));
        unittest.expect(queryMap["endDate"].first, unittest.equals(arg_endDate));
        unittest.expect(queryMap["dimension"], unittest.equals(arg_dimension));
        unittest.expect(queryMap["filter"], unittest.equals(arg_filter));
        unittest.expect(queryMap["locale"].first, unittest.equals(arg_locale));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["metric"], unittest.equals(arg_metric));
        unittest.expect(queryMap["sort"], unittest.equals(arg_sort));
        unittest.expect(core.int.parse(queryMap["startIndex"].first), unittest.equals(arg_startIndex));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildReport());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.generate(arg_accountId, arg_startDate, arg_endDate, dimension: arg_dimension, filter: arg_filter, locale: arg_locale, maxResults: arg_maxResults, metric: arg_metric, sort: arg_sort, startIndex: arg_startIndex).then(unittest.expectAsync(((api.Report response) {
        checkReport(response);
      })));
    });

  });


  unittest.group("resource-AdclientsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AdclientsResourceApi res = new api.AdsensehostApi(mock).adclients;
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdClient());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_adClientId).then(unittest.expectAsync(((api.AdClient response) {
        checkAdClient(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AdclientsResourceApi res = new api.AdsensehostApi(mock).adclients;
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("adclients"));
        pathOffset += 9;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAdClients());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AdClients response) {
        checkAdClients(response);
      })));
    });

  });


  unittest.group("resource-AssociationsessionsResourceApi", () {
    unittest.test("method--start", () {

      var mock = new HttpServerMock();
      api.AssociationsessionsResourceApi res = new api.AdsensehostApi(mock).associationsessions;
      var arg_productCode = buildUnnamed3135();
      var arg_websiteUrl = "foo";
      var arg_userLocale = "foo";
      var arg_websiteLocale = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 25), unittest.equals("associationsessions/start"));
        pathOffset += 25;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["productCode"], unittest.equals(arg_productCode));
        unittest.expect(queryMap["websiteUrl"].first, unittest.equals(arg_websiteUrl));
        unittest.expect(queryMap["userLocale"].first, unittest.equals(arg_userLocale));
        unittest.expect(queryMap["websiteLocale"].first, unittest.equals(arg_websiteLocale));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAssociationSession());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.start(arg_productCode, arg_websiteUrl, userLocale: arg_userLocale, websiteLocale: arg_websiteLocale).then(unittest.expectAsync(((api.AssociationSession response) {
        checkAssociationSession(response);
      })));
    });

    unittest.test("method--verify", () {

      var mock = new HttpServerMock();
      api.AssociationsessionsResourceApi res = new api.AdsensehostApi(mock).associationsessions;
      var arg_token = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 26), unittest.equals("associationsessions/verify"));
        pathOffset += 26;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["token"].first, unittest.equals(arg_token));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAssociationSession());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.verify(arg_token).then(unittest.expectAsync(((api.AssociationSession response) {
        checkAssociationSession(response);
      })));
    });

  });


  unittest.group("resource-CustomchannelsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.CustomchannelsResourceApi res = new api.AdsensehostApi(mock).customchannels;
      var arg_adClientId = "foo";
      var arg_customChannelId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/customchannels/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16), unittest.equals("/customchannels/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_customChannelId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCustomChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_adClientId, arg_customChannelId).then(unittest.expectAsync(((api.CustomChannel response) {
        checkCustomChannel(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.CustomchannelsResourceApi res = new api.AdsensehostApi(mock).customchannels;
      var arg_adClientId = "foo";
      var arg_customChannelId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/customchannels/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16), unittest.equals("/customchannels/"));
        pathOffset += 16;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_customChannelId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCustomChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_adClientId, arg_customChannelId).then(unittest.expectAsync(((api.CustomChannel response) {
        checkCustomChannel(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.CustomchannelsResourceApi res = new api.AdsensehostApi(mock).customchannels;
      var arg_request = buildCustomChannel();
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CustomChannel.fromJson(json);
        checkCustomChannel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/customchannels", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("/customchannels"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCustomChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_adClientId).then(unittest.expectAsync(((api.CustomChannel response) {
        checkCustomChannel(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.CustomchannelsResourceApi res = new api.AdsensehostApi(mock).customchannels;
      var arg_adClientId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/customchannels", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("/customchannels"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCustomChannels());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_adClientId, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.CustomChannels response) {
        checkCustomChannels(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.CustomchannelsResourceApi res = new api.AdsensehostApi(mock).customchannels;
      var arg_request = buildCustomChannel();
      var arg_adClientId = "foo";
      var arg_customChannelId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CustomChannel.fromJson(json);
        checkCustomChannel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/customchannels", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("/customchannels"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["customChannelId"].first, unittest.equals(arg_customChannelId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCustomChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_adClientId, arg_customChannelId).then(unittest.expectAsync(((api.CustomChannel response) {
        checkCustomChannel(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.CustomchannelsResourceApi res = new api.AdsensehostApi(mock).customchannels;
      var arg_request = buildCustomChannel();
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CustomChannel.fromJson(json);
        checkCustomChannel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/customchannels", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("/customchannels"));
        pathOffset += 15;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCustomChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_adClientId).then(unittest.expectAsync(((api.CustomChannel response) {
        checkCustomChannel(response);
      })));
    });

  });


  unittest.group("resource-ReportsResourceApi", () {
    unittest.test("method--generate", () {

      var mock = new HttpServerMock();
      api.ReportsResourceApi res = new api.AdsensehostApi(mock).reports;
      var arg_startDate = "foo";
      var arg_endDate = "foo";
      var arg_dimension = buildUnnamed3136();
      var arg_filter = buildUnnamed3137();
      var arg_locale = "foo";
      var arg_maxResults = 42;
      var arg_metric = buildUnnamed3138();
      var arg_sort = buildUnnamed3139();
      var arg_startIndex = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("reports"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["startDate"].first, unittest.equals(arg_startDate));
        unittest.expect(queryMap["endDate"].first, unittest.equals(arg_endDate));
        unittest.expect(queryMap["dimension"], unittest.equals(arg_dimension));
        unittest.expect(queryMap["filter"], unittest.equals(arg_filter));
        unittest.expect(queryMap["locale"].first, unittest.equals(arg_locale));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["metric"], unittest.equals(arg_metric));
        unittest.expect(queryMap["sort"], unittest.equals(arg_sort));
        unittest.expect(core.int.parse(queryMap["startIndex"].first), unittest.equals(arg_startIndex));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildReport());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.generate(arg_startDate, arg_endDate, dimension: arg_dimension, filter: arg_filter, locale: arg_locale, maxResults: arg_maxResults, metric: arg_metric, sort: arg_sort, startIndex: arg_startIndex).then(unittest.expectAsync(((api.Report response) {
        checkReport(response);
      })));
    });

  });


  unittest.group("resource-UrlchannelsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.UrlchannelsResourceApi res = new api.AdsensehostApi(mock).urlchannels;
      var arg_adClientId = "foo";
      var arg_urlChannelId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/urlchannels/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("/urlchannels/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_urlChannelId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUrlChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_adClientId, arg_urlChannelId).then(unittest.expectAsync(((api.UrlChannel response) {
        checkUrlChannel(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.UrlchannelsResourceApi res = new api.AdsensehostApi(mock).urlchannels;
      var arg_request = buildUrlChannel();
      var arg_adClientId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlChannel.fromJson(json);
        checkUrlChannel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/urlchannels", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/urlchannels"));
        pathOffset += 12;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUrlChannel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_adClientId).then(unittest.expectAsync(((api.UrlChannel response) {
        checkUrlChannel(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.UrlchannelsResourceApi res = new api.AdsensehostApi(mock).urlchannels;
      var arg_adClientId = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("adsensehost/v4.1/"));
        pathOffset += 17;
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("adclients/"));
        pathOffset += 10;
        index = path.indexOf("/urlchannels", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_adClientId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/urlchannels"));
        pathOffset += 12;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUrlChannels());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_adClientId, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.UrlChannels response) {
        checkUrlChannels(response);
      })));
    });

  });


}

