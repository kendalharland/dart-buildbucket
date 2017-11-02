library buildbucket.buildbucket.v1.test;

import "dart:core" as core;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:test/test.dart' as unittest;

import 'package:buildbucket/buildbucket/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request
          .finalize()
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

http.StreamedResponse stringResponse(core.int status,
    core.Map<core.String, core.String> headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterApiBucketMessage = 0;
buildApiBucketMessage() {
  var o = new api.ApiBucketMessage();
  buildCounterApiBucketMessage++;
  if (buildCounterApiBucketMessage < 3) {
    o.configFileContent = "foo";
    o.configFileRev = "foo";
    o.configFileUrl = "foo";
    o.error = buildApiErrorMessage();
    o.name = "foo";
    o.projectId = "foo";
  }
  buildCounterApiBucketMessage--;
  return o;
}

checkApiBucketMessage(api.ApiBucketMessage o) {
  buildCounterApiBucketMessage++;
  if (buildCounterApiBucketMessage < 3) {
    unittest.expect(o.configFileContent, unittest.equals('foo'));
    unittest.expect(o.configFileRev, unittest.equals('foo'));
    unittest.expect(o.configFileUrl, unittest.equals('foo'));
    checkApiErrorMessage(o.error);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
  }
  buildCounterApiBucketMessage--;
}

core.int buildCounterApiBuildResponseMessage = 0;
buildApiBuildResponseMessage() {
  var o = new api.ApiBuildResponseMessage();
  buildCounterApiBuildResponseMessage++;
  if (buildCounterApiBuildResponseMessage < 3) {
    o.build = buildApiCommonBuildMessage();
    o.error = buildApiErrorMessage();
  }
  buildCounterApiBuildResponseMessage--;
  return o;
}

checkApiBuildResponseMessage(api.ApiBuildResponseMessage o) {
  buildCounterApiBuildResponseMessage++;
  if (buildCounterApiBuildResponseMessage < 3) {
    checkApiCommonBuildMessage(o.build);
    checkApiErrorMessage(o.error);
  }
  buildCounterApiBuildResponseMessage--;
}

buildUnnamed0() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed0(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterApiCancelBatchRequestMessage = 0;
buildApiCancelBatchRequestMessage() {
  var o = new api.ApiCancelBatchRequestMessage();
  buildCounterApiCancelBatchRequestMessage++;
  if (buildCounterApiCancelBatchRequestMessage < 3) {
    o.buildIds = buildUnnamed0();
    o.resultDetailsJson = "foo";
  }
  buildCounterApiCancelBatchRequestMessage--;
  return o;
}

checkApiCancelBatchRequestMessage(api.ApiCancelBatchRequestMessage o) {
  buildCounterApiCancelBatchRequestMessage++;
  if (buildCounterApiCancelBatchRequestMessage < 3) {
    checkUnnamed0(o.buildIds);
    unittest.expect(o.resultDetailsJson, unittest.equals('foo'));
  }
  buildCounterApiCancelBatchRequestMessage--;
}

buildUnnamed1() {
  var o = new core.List<api.ApiCancelBatchResponseMessageOneResult>();
  o.add(buildApiCancelBatchResponseMessageOneResult());
  o.add(buildApiCancelBatchResponseMessageOneResult());
  return o;
}

checkUnnamed1(core.List<api.ApiCancelBatchResponseMessageOneResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApiCancelBatchResponseMessageOneResult(o[0]);
  checkApiCancelBatchResponseMessageOneResult(o[1]);
}

core.int buildCounterApiCancelBatchResponseMessage = 0;
buildApiCancelBatchResponseMessage() {
  var o = new api.ApiCancelBatchResponseMessage();
  buildCounterApiCancelBatchResponseMessage++;
  if (buildCounterApiCancelBatchResponseMessage < 3) {
    o.results = buildUnnamed1();
  }
  buildCounterApiCancelBatchResponseMessage--;
  return o;
}

checkApiCancelBatchResponseMessage(api.ApiCancelBatchResponseMessage o) {
  buildCounterApiCancelBatchResponseMessage++;
  if (buildCounterApiCancelBatchResponseMessage < 3) {
    checkUnnamed1(o.results);
  }
  buildCounterApiCancelBatchResponseMessage--;
}

core.int buildCounterApiCancelBatchResponseMessageOneResult = 0;
buildApiCancelBatchResponseMessageOneResult() {
  var o = new api.ApiCancelBatchResponseMessageOneResult();
  buildCounterApiCancelBatchResponseMessageOneResult++;
  if (buildCounterApiCancelBatchResponseMessageOneResult < 3) {
    o.build = buildApiCommonBuildMessage();
    o.buildId = "foo";
    o.error = buildApiErrorMessage();
  }
  buildCounterApiCancelBatchResponseMessageOneResult--;
  return o;
}

checkApiCancelBatchResponseMessageOneResult(
    api.ApiCancelBatchResponseMessageOneResult o) {
  buildCounterApiCancelBatchResponseMessageOneResult++;
  if (buildCounterApiCancelBatchResponseMessageOneResult < 3) {
    checkApiCommonBuildMessage(o.build);
    unittest.expect(o.buildId, unittest.equals('foo'));
    checkApiErrorMessage(o.error);
  }
  buildCounterApiCancelBatchResponseMessageOneResult--;
}

core.int buildCounterApiCancelRequestBodyMessage = 0;
buildApiCancelRequestBodyMessage() {
  var o = new api.ApiCancelRequestBodyMessage();
  buildCounterApiCancelRequestBodyMessage++;
  if (buildCounterApiCancelRequestBodyMessage < 3) {
    o.resultDetailsJson = "foo";
  }
  buildCounterApiCancelRequestBodyMessage--;
  return o;
}

checkApiCancelRequestBodyMessage(api.ApiCancelRequestBodyMessage o) {
  buildCounterApiCancelRequestBodyMessage++;
  if (buildCounterApiCancelRequestBodyMessage < 3) {
    unittest.expect(o.resultDetailsJson, unittest.equals('foo'));
  }
  buildCounterApiCancelRequestBodyMessage--;
}

buildUnnamed2() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterApiCommonBuildMessage = 0;
buildApiCommonBuildMessage() {
  var o = new api.ApiCommonBuildMessage();
  buildCounterApiCommonBuildMessage++;
  if (buildCounterApiCommonBuildMessage < 3) {
    o.bucket = "foo";
    o.canary = true;
    o.canaryPreference = "foo";
    o.cancelationReason = "foo";
    o.completedTs = "foo";
    o.createdBy = "foo";
    o.createdTs = "foo";
    o.failureReason = "foo";
    o.id = "foo";
    o.leaseExpirationTs = "foo";
    o.leaseKey = "foo";
    o.parametersJson = "foo";
    o.result = "foo";
    o.resultDetailsJson = "foo";
    o.retryOf = "foo";
    o.startedTs = "foo";
    o.status = "foo";
    o.statusChangedTs = "foo";
    o.tags = buildUnnamed2();
    o.updatedTs = "foo";
    o.url = "foo";
    o.utcnowTs = "foo";
  }
  buildCounterApiCommonBuildMessage--;
  return o;
}

checkApiCommonBuildMessage(api.ApiCommonBuildMessage o) {
  buildCounterApiCommonBuildMessage++;
  if (buildCounterApiCommonBuildMessage < 3) {
    unittest.expect(o.bucket, unittest.equals('foo'));
    unittest.expect(o.canary, unittest.isTrue);
    unittest.expect(o.canaryPreference, unittest.equals('foo'));
    unittest.expect(o.cancelationReason, unittest.equals('foo'));
    unittest.expect(o.completedTs, unittest.equals('foo'));
    unittest.expect(o.createdBy, unittest.equals('foo'));
    unittest.expect(o.createdTs, unittest.equals('foo'));
    unittest.expect(o.failureReason, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
    unittest.expect(o.leaseKey, unittest.equals('foo'));
    unittest.expect(o.parametersJson, unittest.equals('foo'));
    unittest.expect(o.result, unittest.equals('foo'));
    unittest.expect(o.resultDetailsJson, unittest.equals('foo'));
    unittest.expect(o.retryOf, unittest.equals('foo'));
    unittest.expect(o.startedTs, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.statusChangedTs, unittest.equals('foo'));
    checkUnnamed2(o.tags);
    unittest.expect(o.updatedTs, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
    unittest.expect(o.utcnowTs, unittest.equals('foo'));
  }
  buildCounterApiCommonBuildMessage--;
}

core.int buildCounterApiDeleteManyBuildsResponse = 0;
buildApiDeleteManyBuildsResponse() {
  var o = new api.ApiDeleteManyBuildsResponse();
  buildCounterApiDeleteManyBuildsResponse++;
  if (buildCounterApiDeleteManyBuildsResponse < 3) {
    o.error = buildApiErrorMessage();
  }
  buildCounterApiDeleteManyBuildsResponse--;
  return o;
}

checkApiDeleteManyBuildsResponse(api.ApiDeleteManyBuildsResponse o) {
  buildCounterApiDeleteManyBuildsResponse++;
  if (buildCounterApiDeleteManyBuildsResponse < 3) {
    checkApiErrorMessage(o.error);
  }
  buildCounterApiDeleteManyBuildsResponse--;
}

core.int buildCounterApiErrorMessage = 0;
buildApiErrorMessage() {
  var o = new api.ApiErrorMessage();
  buildCounterApiErrorMessage++;
  if (buildCounterApiErrorMessage < 3) {
    o.message = "foo";
    o.reason = "foo";
  }
  buildCounterApiErrorMessage--;
  return o;
}

checkApiErrorMessage(api.ApiErrorMessage o) {
  buildCounterApiErrorMessage++;
  if (buildCounterApiErrorMessage < 3) {
    unittest.expect(o.message, unittest.equals('foo'));
    unittest.expect(o.reason, unittest.equals('foo'));
  }
  buildCounterApiErrorMessage--;
}

buildUnnamed3() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterApiFailRequestBodyMessage = 0;
buildApiFailRequestBodyMessage() {
  var o = new api.ApiFailRequestBodyMessage();
  buildCounterApiFailRequestBodyMessage++;
  if (buildCounterApiFailRequestBodyMessage < 3) {
    o.failureReason = "foo";
    o.leaseKey = "foo";
    o.newTags = buildUnnamed3();
    o.resultDetailsJson = "foo";
    o.url = "foo";
  }
  buildCounterApiFailRequestBodyMessage--;
  return o;
}

checkApiFailRequestBodyMessage(api.ApiFailRequestBodyMessage o) {
  buildCounterApiFailRequestBodyMessage++;
  if (buildCounterApiFailRequestBodyMessage < 3) {
    unittest.expect(o.failureReason, unittest.equals('foo'));
    unittest.expect(o.leaseKey, unittest.equals('foo'));
    checkUnnamed3(o.newTags);
    unittest.expect(o.resultDetailsJson, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterApiFailRequestBodyMessage--;
}

buildUnnamed4() {
  var o = new core.List<api.ApiHeartbeatBatchRequestMessageOneHeartbeat>();
  o.add(buildApiHeartbeatBatchRequestMessageOneHeartbeat());
  o.add(buildApiHeartbeatBatchRequestMessageOneHeartbeat());
  return o;
}

checkUnnamed4(core.List<api.ApiHeartbeatBatchRequestMessageOneHeartbeat> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApiHeartbeatBatchRequestMessageOneHeartbeat(o[0]);
  checkApiHeartbeatBatchRequestMessageOneHeartbeat(o[1]);
}

core.int buildCounterApiHeartbeatBatchRequestMessage = 0;
buildApiHeartbeatBatchRequestMessage() {
  var o = new api.ApiHeartbeatBatchRequestMessage();
  buildCounterApiHeartbeatBatchRequestMessage++;
  if (buildCounterApiHeartbeatBatchRequestMessage < 3) {
    o.heartbeats = buildUnnamed4();
  }
  buildCounterApiHeartbeatBatchRequestMessage--;
  return o;
}

checkApiHeartbeatBatchRequestMessage(api.ApiHeartbeatBatchRequestMessage o) {
  buildCounterApiHeartbeatBatchRequestMessage++;
  if (buildCounterApiHeartbeatBatchRequestMessage < 3) {
    checkUnnamed4(o.heartbeats);
  }
  buildCounterApiHeartbeatBatchRequestMessage--;
}

core.int buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat = 0;
buildApiHeartbeatBatchRequestMessageOneHeartbeat() {
  var o = new api.ApiHeartbeatBatchRequestMessageOneHeartbeat();
  buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat++;
  if (buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat < 3) {
    o.buildId = "foo";
    o.leaseExpirationTs = "foo";
    o.leaseKey = "foo";
  }
  buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat--;
  return o;
}

checkApiHeartbeatBatchRequestMessageOneHeartbeat(
    api.ApiHeartbeatBatchRequestMessageOneHeartbeat o) {
  buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat++;
  if (buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat < 3) {
    unittest.expect(o.buildId, unittest.equals('foo'));
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
    unittest.expect(o.leaseKey, unittest.equals('foo'));
  }
  buildCounterApiHeartbeatBatchRequestMessageOneHeartbeat--;
}

buildUnnamed5() {
  var o =
      new core.List<api.ApiHeartbeatBatchResponseMessageOneHeartbeatResult>();
  o.add(buildApiHeartbeatBatchResponseMessageOneHeartbeatResult());
  o.add(buildApiHeartbeatBatchResponseMessageOneHeartbeatResult());
  return o;
}

checkUnnamed5(
    core.List<api.ApiHeartbeatBatchResponseMessageOneHeartbeatResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApiHeartbeatBatchResponseMessageOneHeartbeatResult(o[0]);
  checkApiHeartbeatBatchResponseMessageOneHeartbeatResult(o[1]);
}

core.int buildCounterApiHeartbeatBatchResponseMessage = 0;
buildApiHeartbeatBatchResponseMessage() {
  var o = new api.ApiHeartbeatBatchResponseMessage();
  buildCounterApiHeartbeatBatchResponseMessage++;
  if (buildCounterApiHeartbeatBatchResponseMessage < 3) {
    o.results = buildUnnamed5();
  }
  buildCounterApiHeartbeatBatchResponseMessage--;
  return o;
}

checkApiHeartbeatBatchResponseMessage(api.ApiHeartbeatBatchResponseMessage o) {
  buildCounterApiHeartbeatBatchResponseMessage++;
  if (buildCounterApiHeartbeatBatchResponseMessage < 3) {
    checkUnnamed5(o.results);
  }
  buildCounterApiHeartbeatBatchResponseMessage--;
}

core.int buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult = 0;
buildApiHeartbeatBatchResponseMessageOneHeartbeatResult() {
  var o = new api.ApiHeartbeatBatchResponseMessageOneHeartbeatResult();
  buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult++;
  if (buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult < 3) {
    o.buildId = "foo";
    o.error = buildApiErrorMessage();
    o.leaseExpirationTs = "foo";
  }
  buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult--;
  return o;
}

checkApiHeartbeatBatchResponseMessageOneHeartbeatResult(
    api.ApiHeartbeatBatchResponseMessageOneHeartbeatResult o) {
  buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult++;
  if (buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult < 3) {
    unittest.expect(o.buildId, unittest.equals('foo'));
    checkApiErrorMessage(o.error);
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
  }
  buildCounterApiHeartbeatBatchResponseMessageOneHeartbeatResult--;
}

core.int buildCounterApiHeartbeatRequestBodyMessage = 0;
buildApiHeartbeatRequestBodyMessage() {
  var o = new api.ApiHeartbeatRequestBodyMessage();
  buildCounterApiHeartbeatRequestBodyMessage++;
  if (buildCounterApiHeartbeatRequestBodyMessage < 3) {
    o.leaseExpirationTs = "foo";
    o.leaseKey = "foo";
  }
  buildCounterApiHeartbeatRequestBodyMessage--;
  return o;
}

checkApiHeartbeatRequestBodyMessage(api.ApiHeartbeatRequestBodyMessage o) {
  buildCounterApiHeartbeatRequestBodyMessage++;
  if (buildCounterApiHeartbeatRequestBodyMessage < 3) {
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
    unittest.expect(o.leaseKey, unittest.equals('foo'));
  }
  buildCounterApiHeartbeatRequestBodyMessage--;
}

core.int buildCounterApiLeaseRequestBodyMessage = 0;
buildApiLeaseRequestBodyMessage() {
  var o = new api.ApiLeaseRequestBodyMessage();
  buildCounterApiLeaseRequestBodyMessage++;
  if (buildCounterApiLeaseRequestBodyMessage < 3) {
    o.leaseExpirationTs = "foo";
  }
  buildCounterApiLeaseRequestBodyMessage--;
  return o;
}

checkApiLeaseRequestBodyMessage(api.ApiLeaseRequestBodyMessage o) {
  buildCounterApiLeaseRequestBodyMessage++;
  if (buildCounterApiLeaseRequestBodyMessage < 3) {
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
  }
  buildCounterApiLeaseRequestBodyMessage--;
}

core.int buildCounterApiLongestPendingTimeResponse = 0;
buildApiLongestPendingTimeResponse() {
  var o = new api.ApiLongestPendingTimeResponse();
  buildCounterApiLongestPendingTimeResponse++;
  if (buildCounterApiLongestPendingTimeResponse < 3) {
    o.error = buildApiErrorMessage();
    o.longestPendingTimeSec = 42.0;
  }
  buildCounterApiLongestPendingTimeResponse--;
  return o;
}

checkApiLongestPendingTimeResponse(api.ApiLongestPendingTimeResponse o) {
  buildCounterApiLongestPendingTimeResponse++;
  if (buildCounterApiLongestPendingTimeResponse < 3) {
    checkApiErrorMessage(o.error);
    unittest.expect(o.longestPendingTimeSec, unittest.equals(42.0));
  }
  buildCounterApiLongestPendingTimeResponse--;
}

core.int buildCounterApiPauseResponse = 0;
buildApiPauseResponse() {
  var o = new api.ApiPauseResponse();
  buildCounterApiPauseResponse++;
  if (buildCounterApiPauseResponse < 3) {}
  buildCounterApiPauseResponse--;
  return o;
}

checkApiPauseResponse(api.ApiPauseResponse o) {
  buildCounterApiPauseResponse++;
  if (buildCounterApiPauseResponse < 3) {}
  buildCounterApiPauseResponse--;
}

core.int buildCounterApiPubSubCallbackMessage = 0;
buildApiPubSubCallbackMessage() {
  var o = new api.ApiPubSubCallbackMessage();
  buildCounterApiPubSubCallbackMessage++;
  if (buildCounterApiPubSubCallbackMessage < 3) {
    o.authToken = "foo";
    o.topic = "foo";
    o.userData = "foo";
  }
  buildCounterApiPubSubCallbackMessage--;
  return o;
}

checkApiPubSubCallbackMessage(api.ApiPubSubCallbackMessage o) {
  buildCounterApiPubSubCallbackMessage++;
  if (buildCounterApiPubSubCallbackMessage < 3) {
    unittest.expect(o.authToken, unittest.equals('foo'));
    unittest.expect(o.topic, unittest.equals('foo'));
    unittest.expect(o.userData, unittest.equals('foo'));
  }
  buildCounterApiPubSubCallbackMessage--;
}

buildUnnamed6() {
  var o = new core.List<api.ApiPutRequestMessage>();
  o.add(buildApiPutRequestMessage());
  o.add(buildApiPutRequestMessage());
  return o;
}

checkUnnamed6(core.List<api.ApiPutRequestMessage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApiPutRequestMessage(o[0]);
  checkApiPutRequestMessage(o[1]);
}

core.int buildCounterApiPutBatchRequestMessage = 0;
buildApiPutBatchRequestMessage() {
  var o = new api.ApiPutBatchRequestMessage();
  buildCounterApiPutBatchRequestMessage++;
  if (buildCounterApiPutBatchRequestMessage < 3) {
    o.builds = buildUnnamed6();
  }
  buildCounterApiPutBatchRequestMessage--;
  return o;
}

checkApiPutBatchRequestMessage(api.ApiPutBatchRequestMessage o) {
  buildCounterApiPutBatchRequestMessage++;
  if (buildCounterApiPutBatchRequestMessage < 3) {
    checkUnnamed6(o.builds);
  }
  buildCounterApiPutBatchRequestMessage--;
}

buildUnnamed7() {
  var o = new core.List<api.ApiPutBatchResponseMessageOneResult>();
  o.add(buildApiPutBatchResponseMessageOneResult());
  o.add(buildApiPutBatchResponseMessageOneResult());
  return o;
}

checkUnnamed7(core.List<api.ApiPutBatchResponseMessageOneResult> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApiPutBatchResponseMessageOneResult(o[0]);
  checkApiPutBatchResponseMessageOneResult(o[1]);
}

core.int buildCounterApiPutBatchResponseMessage = 0;
buildApiPutBatchResponseMessage() {
  var o = new api.ApiPutBatchResponseMessage();
  buildCounterApiPutBatchResponseMessage++;
  if (buildCounterApiPutBatchResponseMessage < 3) {
    o.error = buildApiErrorMessage();
    o.results = buildUnnamed7();
  }
  buildCounterApiPutBatchResponseMessage--;
  return o;
}

checkApiPutBatchResponseMessage(api.ApiPutBatchResponseMessage o) {
  buildCounterApiPutBatchResponseMessage++;
  if (buildCounterApiPutBatchResponseMessage < 3) {
    checkApiErrorMessage(o.error);
    checkUnnamed7(o.results);
  }
  buildCounterApiPutBatchResponseMessage--;
}

core.int buildCounterApiPutBatchResponseMessageOneResult = 0;
buildApiPutBatchResponseMessageOneResult() {
  var o = new api.ApiPutBatchResponseMessageOneResult();
  buildCounterApiPutBatchResponseMessageOneResult++;
  if (buildCounterApiPutBatchResponseMessageOneResult < 3) {
    o.build = buildApiCommonBuildMessage();
    o.clientOperationId = "foo";
    o.error = buildApiErrorMessage();
  }
  buildCounterApiPutBatchResponseMessageOneResult--;
  return o;
}

checkApiPutBatchResponseMessageOneResult(
    api.ApiPutBatchResponseMessageOneResult o) {
  buildCounterApiPutBatchResponseMessageOneResult++;
  if (buildCounterApiPutBatchResponseMessageOneResult < 3) {
    checkApiCommonBuildMessage(o.build);
    unittest.expect(o.clientOperationId, unittest.equals('foo'));
    checkApiErrorMessage(o.error);
  }
  buildCounterApiPutBatchResponseMessageOneResult--;
}

buildUnnamed8() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed8(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterApiPutRequestMessage = 0;
buildApiPutRequestMessage() {
  var o = new api.ApiPutRequestMessage();
  buildCounterApiPutRequestMessage++;
  if (buildCounterApiPutRequestMessage < 3) {
    o.bucket = "foo";
    o.canaryPreference = "foo";
    o.clientOperationId = "foo";
    o.leaseExpirationTs = "foo";
    o.parametersJson = "foo";
    o.pubsubCallback = buildApiPubSubCallbackMessage();
    o.tags = buildUnnamed8();
  }
  buildCounterApiPutRequestMessage--;
  return o;
}

checkApiPutRequestMessage(api.ApiPutRequestMessage o) {
  buildCounterApiPutRequestMessage++;
  if (buildCounterApiPutRequestMessage < 3) {
    unittest.expect(o.bucket, unittest.equals('foo'));
    unittest.expect(o.canaryPreference, unittest.equals('foo'));
    unittest.expect(o.clientOperationId, unittest.equals('foo'));
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
    unittest.expect(o.parametersJson, unittest.equals('foo'));
    checkApiPubSubCallbackMessage(o.pubsubCallback);
    checkUnnamed8(o.tags);
  }
  buildCounterApiPutRequestMessage--;
}

core.int buildCounterApiRetryRequestMessage = 0;
buildApiRetryRequestMessage() {
  var o = new api.ApiRetryRequestMessage();
  buildCounterApiRetryRequestMessage++;
  if (buildCounterApiRetryRequestMessage < 3) {
    o.clientOperationId = "foo";
    o.leaseExpirationTs = "foo";
    o.pubsubCallback = buildApiPubSubCallbackMessage();
  }
  buildCounterApiRetryRequestMessage--;
  return o;
}

checkApiRetryRequestMessage(api.ApiRetryRequestMessage o) {
  buildCounterApiRetryRequestMessage++;
  if (buildCounterApiRetryRequestMessage < 3) {
    unittest.expect(o.clientOperationId, unittest.equals('foo'));
    unittest.expect(o.leaseExpirationTs, unittest.equals('foo'));
    checkApiPubSubCallbackMessage(o.pubsubCallback);
  }
  buildCounterApiRetryRequestMessage--;
}

buildUnnamed9() {
  var o = new core.List<api.ApiCommonBuildMessage>();
  o.add(buildApiCommonBuildMessage());
  o.add(buildApiCommonBuildMessage());
  return o;
}

checkUnnamed9(core.List<api.ApiCommonBuildMessage> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkApiCommonBuildMessage(o[0]);
  checkApiCommonBuildMessage(o[1]);
}

core.int buildCounterApiSearchResponseMessage = 0;
buildApiSearchResponseMessage() {
  var o = new api.ApiSearchResponseMessage();
  buildCounterApiSearchResponseMessage++;
  if (buildCounterApiSearchResponseMessage < 3) {
    o.builds = buildUnnamed9();
    o.error = buildApiErrorMessage();
    o.nextCursor = "foo";
  }
  buildCounterApiSearchResponseMessage--;
  return o;
}

checkApiSearchResponseMessage(api.ApiSearchResponseMessage o) {
  buildCounterApiSearchResponseMessage++;
  if (buildCounterApiSearchResponseMessage < 3) {
    checkUnnamed9(o.builds);
    checkApiErrorMessage(o.error);
    unittest.expect(o.nextCursor, unittest.equals('foo'));
  }
  buildCounterApiSearchResponseMessage--;
}

core.int buildCounterApiStartRequestBodyMessage = 0;
buildApiStartRequestBodyMessage() {
  var o = new api.ApiStartRequestBodyMessage();
  buildCounterApiStartRequestBodyMessage++;
  if (buildCounterApiStartRequestBodyMessage < 3) {
    o.canary = true;
    o.leaseKey = "foo";
    o.url = "foo";
  }
  buildCounterApiStartRequestBodyMessage--;
  return o;
}

checkApiStartRequestBodyMessage(api.ApiStartRequestBodyMessage o) {
  buildCounterApiStartRequestBodyMessage++;
  if (buildCounterApiStartRequestBodyMessage < 3) {
    unittest.expect(o.canary, unittest.isTrue);
    unittest.expect(o.leaseKey, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterApiStartRequestBodyMessage--;
}

buildUnnamed10() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed10(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterApiSucceedRequestBodyMessage = 0;
buildApiSucceedRequestBodyMessage() {
  var o = new api.ApiSucceedRequestBodyMessage();
  buildCounterApiSucceedRequestBodyMessage++;
  if (buildCounterApiSucceedRequestBodyMessage < 3) {
    o.leaseKey = "foo";
    o.newTags = buildUnnamed10();
    o.resultDetailsJson = "foo";
    o.url = "foo";
  }
  buildCounterApiSucceedRequestBodyMessage--;
  return o;
}

checkApiSucceedRequestBodyMessage(api.ApiSucceedRequestBodyMessage o) {
  buildCounterApiSucceedRequestBodyMessage++;
  if (buildCounterApiSucceedRequestBodyMessage < 3) {
    unittest.expect(o.leaseKey, unittest.equals('foo'));
    checkUnnamed10(o.newTags);
    unittest.expect(o.resultDetailsJson, unittest.equals('foo'));
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterApiSucceedRequestBodyMessage--;
}

buildUnnamed11() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed11(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed12() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed12(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed13() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed13(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed14() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed14(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

main() {
  unittest.group("obj-schema-ApiBucketMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiBucketMessage();
      var od = new api.ApiBucketMessage.fromJson(o.toJson());
      checkApiBucketMessage(od);
    });
  });

  unittest.group("obj-schema-ApiBuildResponseMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiBuildResponseMessage();
      var od = new api.ApiBuildResponseMessage.fromJson(o.toJson());
      checkApiBuildResponseMessage(od);
    });
  });

  unittest.group("obj-schema-ApiCancelBatchRequestMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiCancelBatchRequestMessage();
      var od = new api.ApiCancelBatchRequestMessage.fromJson(o.toJson());
      checkApiCancelBatchRequestMessage(od);
    });
  });

  unittest.group("obj-schema-ApiCancelBatchResponseMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiCancelBatchResponseMessage();
      var od = new api.ApiCancelBatchResponseMessage.fromJson(o.toJson());
      checkApiCancelBatchResponseMessage(od);
    });
  });

  unittest.group("obj-schema-ApiCancelBatchResponseMessageOneResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiCancelBatchResponseMessageOneResult();
      var od =
          new api.ApiCancelBatchResponseMessageOneResult.fromJson(o.toJson());
      checkApiCancelBatchResponseMessageOneResult(od);
    });
  });

  unittest.group("obj-schema-ApiCancelRequestBodyMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiCancelRequestBodyMessage();
      var od = new api.ApiCancelRequestBodyMessage.fromJson(o.toJson());
      checkApiCancelRequestBodyMessage(od);
    });
  });

  unittest.group("obj-schema-ApiCommonBuildMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiCommonBuildMessage();
      var od = new api.ApiCommonBuildMessage.fromJson(o.toJson());
      checkApiCommonBuildMessage(od);
    });
  });

  unittest.group("obj-schema-ApiDeleteManyBuildsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiDeleteManyBuildsResponse();
      var od = new api.ApiDeleteManyBuildsResponse.fromJson(o.toJson());
      checkApiDeleteManyBuildsResponse(od);
    });
  });

  unittest.group("obj-schema-ApiErrorMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiErrorMessage();
      var od = new api.ApiErrorMessage.fromJson(o.toJson());
      checkApiErrorMessage(od);
    });
  });

  unittest.group("obj-schema-ApiFailRequestBodyMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiFailRequestBodyMessage();
      var od = new api.ApiFailRequestBodyMessage.fromJson(o.toJson());
      checkApiFailRequestBodyMessage(od);
    });
  });

  unittest.group("obj-schema-ApiHeartbeatBatchRequestMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiHeartbeatBatchRequestMessage();
      var od = new api.ApiHeartbeatBatchRequestMessage.fromJson(o.toJson());
      checkApiHeartbeatBatchRequestMessage(od);
    });
  });

  unittest.group("obj-schema-ApiHeartbeatBatchRequestMessageOneHeartbeat", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiHeartbeatBatchRequestMessageOneHeartbeat();
      var od = new api.ApiHeartbeatBatchRequestMessageOneHeartbeat.fromJson(
          o.toJson());
      checkApiHeartbeatBatchRequestMessageOneHeartbeat(od);
    });
  });

  unittest.group("obj-schema-ApiHeartbeatBatchResponseMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiHeartbeatBatchResponseMessage();
      var od = new api.ApiHeartbeatBatchResponseMessage.fromJson(o.toJson());
      checkApiHeartbeatBatchResponseMessage(od);
    });
  });

  unittest.group(
      "obj-schema-ApiHeartbeatBatchResponseMessageOneHeartbeatResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiHeartbeatBatchResponseMessageOneHeartbeatResult();
      var od =
          new api.ApiHeartbeatBatchResponseMessageOneHeartbeatResult.fromJson(
              o.toJson());
      checkApiHeartbeatBatchResponseMessageOneHeartbeatResult(od);
    });
  });

  unittest.group("obj-schema-ApiHeartbeatRequestBodyMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiHeartbeatRequestBodyMessage();
      var od = new api.ApiHeartbeatRequestBodyMessage.fromJson(o.toJson());
      checkApiHeartbeatRequestBodyMessage(od);
    });
  });

  unittest.group("obj-schema-ApiLeaseRequestBodyMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiLeaseRequestBodyMessage();
      var od = new api.ApiLeaseRequestBodyMessage.fromJson(o.toJson());
      checkApiLeaseRequestBodyMessage(od);
    });
  });

  unittest.group("obj-schema-ApiLongestPendingTimeResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiLongestPendingTimeResponse();
      var od = new api.ApiLongestPendingTimeResponse.fromJson(o.toJson());
      checkApiLongestPendingTimeResponse(od);
    });
  });

  unittest.group("obj-schema-ApiPauseResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiPauseResponse();
      var od = new api.ApiPauseResponse.fromJson(o.toJson());
      checkApiPauseResponse(od);
    });
  });

  unittest.group("obj-schema-ApiPubSubCallbackMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiPubSubCallbackMessage();
      var od = new api.ApiPubSubCallbackMessage.fromJson(o.toJson());
      checkApiPubSubCallbackMessage(od);
    });
  });

  unittest.group("obj-schema-ApiPutBatchRequestMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiPutBatchRequestMessage();
      var od = new api.ApiPutBatchRequestMessage.fromJson(o.toJson());
      checkApiPutBatchRequestMessage(od);
    });
  });

  unittest.group("obj-schema-ApiPutBatchResponseMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiPutBatchResponseMessage();
      var od = new api.ApiPutBatchResponseMessage.fromJson(o.toJson());
      checkApiPutBatchResponseMessage(od);
    });
  });

  unittest.group("obj-schema-ApiPutBatchResponseMessageOneResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiPutBatchResponseMessageOneResult();
      var od = new api.ApiPutBatchResponseMessageOneResult.fromJson(o.toJson());
      checkApiPutBatchResponseMessageOneResult(od);
    });
  });

  unittest.group("obj-schema-ApiPutRequestMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiPutRequestMessage();
      var od = new api.ApiPutRequestMessage.fromJson(o.toJson());
      checkApiPutRequestMessage(od);
    });
  });

  unittest.group("obj-schema-ApiRetryRequestMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiRetryRequestMessage();
      var od = new api.ApiRetryRequestMessage.fromJson(o.toJson());
      checkApiRetryRequestMessage(od);
    });
  });

  unittest.group("obj-schema-ApiSearchResponseMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiSearchResponseMessage();
      var od = new api.ApiSearchResponseMessage.fromJson(o.toJson());
      checkApiSearchResponseMessage(od);
    });
  });

  unittest.group("obj-schema-ApiStartRequestBodyMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiStartRequestBodyMessage();
      var od = new api.ApiStartRequestBodyMessage.fromJson(o.toJson());
      checkApiStartRequestBodyMessage(od);
    });
  });

  unittest.group("obj-schema-ApiSucceedRequestBodyMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildApiSucceedRequestBodyMessage();
      var od = new api.ApiSucceedRequestBodyMessage.fromJson(o.toJson());
      checkApiSucceedRequestBodyMessage(od);
    });
  });

  unittest.group("resource-BuildbucketApi", () {
    unittest.test("method--backfillTagIndex", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_tag = "foo";
      var arg_shards = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 18),
            unittest.equals("backfill_tag_index"));
        pathOffset += 18;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["tag"].first, unittest.equals(arg_tag));
        unittest.expect(queryMap["shards"].first, unittest.equals(arg_shards));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .backfillTagIndex(arg_tag, arg_shards, $fields: arg_$fields)
          .then(unittest.expectAsync1((_) {}));
    });

    unittest.test("method--cancel", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiCancelRequestBodyMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiCancelRequestBodyMessage.fromJson(json);
        checkApiCancelRequestBodyMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/cancel", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/cancel"));
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .cancel(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--cancelBatch", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiCancelBatchRequestMessage();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiCancelBatchRequestMessage.fromJson(json);
        checkApiCancelBatchRequestMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 13),
            unittest.equals("builds/cancel"));
        pathOffset += 13;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiCancelBatchResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.cancelBatch(arg_request, $fields: arg_$fields).then(
          unittest.expectAsync1(((api.ApiCancelBatchResponseMessage response) {
        checkApiCancelBatchResponseMessage(response);
      })));
    });

    unittest.test("method--deleteManyBuilds", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_bucket = "foo";
      var arg_status = "foo";
      var arg_createdBy = "foo";
      var arg_tag = buildUnnamed11();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("bucket/"));
        pathOffset += 7;
        index = path.indexOf("/delete", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_bucket"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("/delete"));
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["status"].first, unittest.equals(arg_status));
        unittest.expect(
            queryMap["created_by"].first, unittest.equals(arg_createdBy));
        unittest.expect(queryMap["tag"], unittest.equals(arg_tag));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiDeleteManyBuildsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .deleteManyBuilds(arg_bucket, arg_status,
              createdBy: arg_createdBy, tag: arg_tag, $fields: arg_$fields)
          .then(unittest
              .expectAsync1(((api.ApiDeleteManyBuildsResponse response) {
        checkApiDeleteManyBuildsResponse(response);
      })));
    });

    unittest.test("method--fail", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiFailRequestBodyMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiFailRequestBodyMessage.fromJson(json);
        checkApiFailRequestBodyMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/fail", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5),
            unittest.equals("/fail"));
        pathOffset += 5;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .fail(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--get", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .get(arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--getBucket", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_bucket = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("buckets/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_bucket"));

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBucketMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .getBucket(arg_bucket, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBucketMessage response) {
        checkApiBucketMessage(response);
      })));
    });

    unittest.test("method--heartbeat", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiHeartbeatRequestBodyMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiHeartbeatRequestBodyMessage.fromJson(json);
        checkApiHeartbeatRequestBodyMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/heartbeat", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10),
            unittest.equals("/heartbeat"));
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .heartbeat(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--heartbeatBatch", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiHeartbeatBatchRequestMessage();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiHeartbeatBatchRequestMessage.fromJson(json);
        checkApiHeartbeatBatchRequestMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("heartbeat"));
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiHeartbeatBatchResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.heartbeatBatch(arg_request, $fields: arg_$fields).then(unittest
          .expectAsync1(((api.ApiHeartbeatBatchResponseMessage response) {
        checkApiHeartbeatBatchResponseMessage(response);
      })));
    });

    unittest.test("method--lease", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiLeaseRequestBodyMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiLeaseRequestBodyMessage.fromJson(json);
        checkApiLeaseRequestBodyMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/lease", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/lease"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .lease(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--longestPendingTime", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_bucket = "foo";
      var arg_builder = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 28),
            unittest.equals("metrics/longest-pending-time"));
        pathOffset += 28;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["bucket"].first, unittest.equals(arg_bucket));
        unittest.expect(
            queryMap["builder"].first, unittest.equals(arg_builder));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiLongestPendingTimeResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .longestPendingTime(arg_bucket, arg_builder, $fields: arg_$fields)
          .then(unittest
              .expectAsync1(((api.ApiLongestPendingTimeResponse response) {
        checkApiLongestPendingTimeResponse(response);
      })));
    });

    unittest.test("method--pause", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_bucket = "foo";
      var arg_isPaused = true;
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("buckets/"));
        pathOffset += 8;
        index = path.indexOf("/pause", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_bucket"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/pause"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(
            queryMap["is_paused"].first, unittest.equals("$arg_isPaused"));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiPauseResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .pause(arg_bucket, arg_isPaused, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiPauseResponse response) {
        checkApiPauseResponse(response);
      })));
    });

    unittest.test("method--peek", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_bucket = buildUnnamed12();
      var arg_maxBuilds = 42;
      var arg_startCursor = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 4),
            unittest.equals("peek"));
        pathOffset += 4;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["bucket"], unittest.equals(arg_bucket));
        unittest.expect(core.int.parse(queryMap["max_builds"].first),
            unittest.equals(arg_maxBuilds));
        unittest.expect(
            queryMap["start_cursor"].first, unittest.equals(arg_startCursor));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiSearchResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .peek(
              bucket: arg_bucket,
              maxBuilds: arg_maxBuilds,
              startCursor: arg_startCursor,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiSearchResponseMessage response) {
        checkApiSearchResponseMessage(response);
      })));
    });

    unittest.test("method--put", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiPutRequestMessage();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiPutRequestMessage.fromJson(json);
        checkApiPutRequestMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("builds"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .put(arg_request, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--putBatch", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiPutBatchRequestMessage();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiPutBatchRequestMessage.fromJson(json);
        checkApiPutBatchRequestMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 12),
            unittest.equals("builds/batch"));
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiPutBatchResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.putBatch(arg_request, $fields: arg_$fields).then(
          unittest.expectAsync1(((api.ApiPutBatchResponseMessage response) {
        checkApiPutBatchResponseMessage(response);
      })));
    });

    unittest.test("method--reset", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/reset", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/reset"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .reset(arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--retry", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiRetryRequestMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiRetryRequestMessage.fromJson(json);
        checkApiRetryRequestMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/retry", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/retry"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .retry(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--search", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_bucket = buildUnnamed13();
      var arg_canary = true;
      var arg_cancelationReason = "foo";
      var arg_createdBy = "foo";
      var arg_creationTsHigh = "foo";
      var arg_creationTsLow = "foo";
      var arg_failureReason = "foo";
      var arg_maxBuilds = 42;
      var arg_result = "foo";
      var arg_retryOf = "foo";
      var arg_startCursor = "foo";
      var arg_status = "foo";
      var arg_tag = buildUnnamed14();
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("search"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["bucket"], unittest.equals(arg_bucket));
        unittest.expect(
            queryMap["canary"].first, unittest.equals("$arg_canary"));
        unittest.expect(queryMap["cancelation_reason"].first,
            unittest.equals(arg_cancelationReason));
        unittest.expect(
            queryMap["created_by"].first, unittest.equals(arg_createdBy));
        unittest.expect(queryMap["creation_ts_high"].first,
            unittest.equals(arg_creationTsHigh));
        unittest.expect(queryMap["creation_ts_low"].first,
            unittest.equals(arg_creationTsLow));
        unittest.expect(queryMap["failure_reason"].first,
            unittest.equals(arg_failureReason));
        unittest.expect(core.int.parse(queryMap["max_builds"].first),
            unittest.equals(arg_maxBuilds));
        unittest.expect(queryMap["result"].first, unittest.equals(arg_result));
        unittest.expect(
            queryMap["retry_of"].first, unittest.equals(arg_retryOf));
        unittest.expect(
            queryMap["start_cursor"].first, unittest.equals(arg_startCursor));
        unittest.expect(queryMap["status"].first, unittest.equals(arg_status));
        unittest.expect(queryMap["tag"], unittest.equals(arg_tag));
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiSearchResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .search(
              bucket: arg_bucket,
              canary: arg_canary,
              cancelationReason: arg_cancelationReason,
              createdBy: arg_createdBy,
              creationTsHigh: arg_creationTsHigh,
              creationTsLow: arg_creationTsLow,
              failureReason: arg_failureReason,
              maxBuilds: arg_maxBuilds,
              result: arg_result,
              retryOf: arg_retryOf,
              startCursor: arg_startCursor,
              status: arg_status,
              tag: arg_tag,
              $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiSearchResponseMessage response) {
        checkApiSearchResponseMessage(response);
      })));
    });

    unittest.test("method--start", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiStartRequestBodyMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiStartRequestBodyMessage.fromJson(json);
        checkApiStartRequestBodyMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/start", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6),
            unittest.equals("/start"));
        pathOffset += 6;

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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .start(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });

    unittest.test("method--succeed", () {
      var mock = new HttpServerMock();
      api.BuildbucketApi res = new api.BuildbucketApi(mock);
      var arg_request = buildApiSucceedRequestBodyMessage();
      var arg_id = "foo";
      var arg_$fields = "foo";
      mock.register(unittest.expectAsync2((http.BaseRequest req, json) {
        var obj = new api.ApiSucceedRequestBodyMessage.fromJson(json);
        checkApiSucceedRequestBodyMessage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 9),
            unittest.equals("/_ah/api/"));
        pathOffset += 9;
        unittest.expect(path.substring(pathOffset, pathOffset + 15),
            unittest.equals("buildbucket/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7),
            unittest.equals("builds/"));
        pathOffset += 7;
        index = path.indexOf("/succeed", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart =
            core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_id"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8),
            unittest.equals("/succeed"));
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
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]),
                core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["fields"].first, unittest.equals(arg_$fields));

        var h = {
          "content-type": "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildApiBuildResponseMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res
          .succeed(arg_request, arg_id, $fields: arg_$fields)
          .then(unittest.expectAsync1(((api.ApiBuildResponseMessage response) {
        checkApiBuildResponseMessage(response);
      })));
    });
  });
}
