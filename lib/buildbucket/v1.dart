// This is a generated file (see the discoveryapis_generator project).

library buildbucket.buildbucket.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client buildbucket/v1';

/// API for scheduling builds.
class BuildbucketApi {
  /// View your email address
  static const UserinfoEmailScope =
      "https://www.buildbucket.com/auth/userinfo.email";

  final commons.ApiRequester _requester;

  BuildbucketApi(http.Client client,
      {core.String rootUrl: "https://cr-buildbucket.appspot.com/_ah/api/",
      core.String servicePath: "buildbucket/v1/"})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /// Backfills TagIndex entites from builds.
  ///
  /// Request parameters:
  ///
  /// [tag] - null
  ///
  /// [shards] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future backfillTagIndex(core.String tag, core.String shards,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (tag == null) {
      throw new core.ArgumentError("Parameter tag is required.");
    }
    _queryParams["tag"] = [tag];
    if (shards == null) {
      throw new core.ArgumentError("Parameter shards is required.");
    }
    _queryParams["shards"] = [shards];
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _downloadOptions = null;

    _url = 'backfill_tag_index';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  /// Cancels a build.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> cancel(
      ApiCancelRequestBodyMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/cancel';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Cancels builds.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiCancelBatchResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiCancelBatchResponseMessage> cancelBatch(
      ApiCancelBatchRequestMessage request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/cancel';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiCancelBatchResponseMessage.fromJson(data));
  }

  /// Deletes scheduled or started builds in a bucket.
  ///
  /// Request parameters:
  ///
  /// [bucket] - null
  ///
  /// [status] - null
  /// Possible string values are:
  /// - "COMPLETED"
  /// - "SCHEDULED"
  /// - "STARTED"
  ///
  /// [createdBy] - null
  ///
  /// [tag] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiDeleteManyBuildsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiDeleteManyBuildsResponse> deleteManyBuilds(
      core.String bucket, core.String status,
      {core.String createdBy,
      core.List<core.String> tag,
      core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (bucket == null) {
      throw new core.ArgumentError("Parameter bucket is required.");
    }
    if (status == null) {
      throw new core.ArgumentError("Parameter status is required.");
    }
    _queryParams["status"] = [status];
    if (createdBy != null) {
      _queryParams["created_by"] = [createdBy];
    }
    if (tag != null) {
      _queryParams["tag"] = tag;
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'bucket/' + commons.Escaper.ecapeVariable('$bucket') + '/delete';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiDeleteManyBuildsResponse.fromJson(data));
  }

  /// Marks a build as failed.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> fail(
      ApiFailRequestBodyMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/fail';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Returns a build by id.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> get(core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Returns bucket information.
  ///
  /// Request parameters:
  ///
  /// [bucket] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBucketMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBucketMessage> getBucket(core.String bucket,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (bucket == null) {
      throw new core.ArgumentError("Parameter bucket is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'buckets/' + commons.Escaper.ecapeVariable('$bucket');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBucketMessage.fromJson(data));
  }

  /// Updates build lease.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> heartbeat(
      ApiHeartbeatRequestBodyMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/heartbeat';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Updates multiple build leases.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiHeartbeatBatchResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiHeartbeatBatchResponseMessage> heartbeatBatch(
      ApiHeartbeatBatchRequestMessage request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'heartbeat';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiHeartbeatBatchResponseMessage.fromJson(data));
  }

  /// Leases a build. Response may contain an error.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> lease(
      ApiLeaseRequestBodyMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/lease';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Returns longest pending time among all SCHEDULED builds of a builder.
  ///
  /// Request parameters:
  ///
  /// [bucket] - null
  ///
  /// [builder] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiLongestPendingTimeResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiLongestPendingTimeResponse> longestPendingTime(
      core.String bucket, core.String builder,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (bucket == null) {
      throw new core.ArgumentError("Parameter bucket is required.");
    }
    _queryParams["bucket"] = [bucket];
    if (builder == null) {
      throw new core.ArgumentError("Parameter builder is required.");
    }
    _queryParams["builder"] = [builder];
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'metrics/longest-pending-time';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiLongestPendingTimeResponse.fromJson(data));
  }

  /// Pauses or unpause a bucket.
  ///
  /// Request parameters:
  ///
  /// [bucket] - null
  ///
  /// [isPaused] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiPauseResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiPauseResponse> pause(core.String bucket, core.bool isPaused,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (bucket == null) {
      throw new core.ArgumentError("Parameter bucket is required.");
    }
    if (isPaused == null) {
      throw new core.ArgumentError("Parameter isPaused is required.");
    }
    _queryParams["is_paused"] = ["${isPaused}"];
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'buckets/' + commons.Escaper.ecapeVariable('$bucket') + '/pause';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiPauseResponse.fromJson(data));
  }

  /// Returns available builds.
  ///
  /// Request parameters:
  ///
  /// [bucket] - null
  ///
  /// [maxBuilds] - null
  ///
  /// [startCursor] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiSearchResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiSearchResponseMessage> peek(
      {core.List<core.String> bucket,
      core.int maxBuilds,
      core.String startCursor,
      core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (bucket != null) {
      _queryParams["bucket"] = bucket;
    }
    if (maxBuilds != null) {
      _queryParams["max_builds"] = ["${maxBuilds}"];
    }
    if (startCursor != null) {
      _queryParams["start_cursor"] = [startCursor];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'peek';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiSearchResponseMessage.fromJson(data));
  }

  /// Creates a new build.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> put(ApiPutRequestMessage request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds';

    var _response = _requester.request(_url, "PUT",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Creates builds.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiPutBatchResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiPutBatchResponseMessage> putBatch(
      ApiPutBatchRequestMessage request,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/batch';

    var _response = _requester.request(_url, "PUT",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiPutBatchResponseMessage.fromJson(data));
  }

  /// Forcibly unleases a build and resets its state to SCHEDULED.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> reset(core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/reset';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Retries an existing build.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> retry(
      ApiRetryRequestMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/retry';

    var _response = _requester.request(_url, "PUT",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Searches for builds.
  ///
  /// Request parameters:
  ///
  /// [bucket] - null
  ///
  /// [canary] - null
  ///
  /// [cancelationReason] - null
  /// Possible string values are:
  /// - "CANCELED_EXPLICITLY"
  /// - "TIMEOUT"
  ///
  /// [createdBy] - null
  ///
  /// [creationTsHigh] - null
  ///
  /// [creationTsLow] - null
  ///
  /// [failureReason] - null
  /// Possible string values are:
  /// - "BUILDBUCKET_FAILURE"
  /// - "BUILD_FAILURE"
  /// - "INFRA_FAILURE"
  /// - "INVALID_BUILD_DEFINITION"
  ///
  /// [maxBuilds] - null
  ///
  /// [result] - null
  /// Possible string values are:
  /// - "CANCELED"
  /// - "FAILURE"
  /// - "SUCCESS"
  ///
  /// [retryOf] - null
  ///
  /// [startCursor] - null
  ///
  /// [status] - null
  /// Possible string values are:
  /// - "COMPLETED"
  /// - "INCOMPLETE"
  /// - "SCHEDULED"
  /// - "STARTED"
  ///
  /// [tag] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiSearchResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiSearchResponseMessage> search(
      {core.List<core.String> bucket,
      core.bool canary,
      core.String cancelationReason,
      core.String createdBy,
      core.String creationTsHigh,
      core.String creationTsLow,
      core.String failureReason,
      core.int maxBuilds,
      core.String result,
      core.String retryOf,
      core.String startCursor,
      core.String status,
      core.List<core.String> tag,
      core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (bucket != null) {
      _queryParams["bucket"] = bucket;
    }
    if (canary != null) {
      _queryParams["canary"] = ["${canary}"];
    }
    if (cancelationReason != null) {
      _queryParams["cancelation_reason"] = [cancelationReason];
    }
    if (createdBy != null) {
      _queryParams["created_by"] = [createdBy];
    }
    if (creationTsHigh != null) {
      _queryParams["creation_ts_high"] = [creationTsHigh];
    }
    if (creationTsLow != null) {
      _queryParams["creation_ts_low"] = [creationTsLow];
    }
    if (failureReason != null) {
      _queryParams["failure_reason"] = [failureReason];
    }
    if (maxBuilds != null) {
      _queryParams["max_builds"] = ["${maxBuilds}"];
    }
    if (result != null) {
      _queryParams["result"] = [result];
    }
    if (retryOf != null) {
      _queryParams["retry_of"] = [retryOf];
    }
    if (startCursor != null) {
      _queryParams["start_cursor"] = [startCursor];
    }
    if (status != null) {
      _queryParams["status"] = [status];
    }
    if (tag != null) {
      _queryParams["tag"] = tag;
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'search';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new ApiSearchResponseMessage.fromJson(data));
  }

  /// Marks a build as started.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> start(
      ApiStartRequestBodyMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/start';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }

  /// Marks a build as succeeded.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [id] - null
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ApiBuildResponseMessage].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ApiBuildResponseMessage> succeed(
      ApiSucceedRequestBodyMessage request, core.String id,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'builds/' + commons.Escaper.ecapeVariable('$id') + '/succeed';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ApiBuildResponseMessage.fromJson(data));
  }
}

class ApiBucketMessage {
  core.String configFileContent;
  core.String configFileRev;
  core.String configFileUrl;
  ApiErrorMessage error;
  core.String name;
  core.String projectId;

  ApiBucketMessage();

  ApiBucketMessage.fromJson(core.Map _json) {
    if (_json.containsKey("config_file_content")) {
      configFileContent = _json["config_file_content"];
    }
    if (_json.containsKey("config_file_rev")) {
      configFileRev = _json["config_file_rev"];
    }
    if (_json.containsKey("config_file_url")) {
      configFileUrl = _json["config_file_url"];
    }
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("project_id")) {
      projectId = _json["project_id"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (configFileContent != null) {
      _json["config_file_content"] = configFileContent;
    }
    if (configFileRev != null) {
      _json["config_file_rev"] = configFileRev;
    }
    if (configFileUrl != null) {
      _json["config_file_url"] = configFileUrl;
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (projectId != null) {
      _json["project_id"] = projectId;
    }
    return _json;
  }
}

class ApiBuildResponseMessage {
  /// Describes model.Build, see its docstring.
  ApiCommonBuildMessage build;
  ApiErrorMessage error;

  ApiBuildResponseMessage();

  ApiBuildResponseMessage.fromJson(core.Map _json) {
    if (_json.containsKey("build")) {
      build = new ApiCommonBuildMessage.fromJson(_json["build"]);
    }
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (build != null) {
      _json["build"] = (build).toJson();
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    return _json;
  }
}

class ApiCancelBatchRequestMessage {
  core.List<core.String> buildIds;
  core.String resultDetailsJson;

  ApiCancelBatchRequestMessage();

  ApiCancelBatchRequestMessage.fromJson(core.Map _json) {
    if (_json.containsKey("build_ids")) {
      buildIds = _json["build_ids"];
    }
    if (_json.containsKey("result_details_json")) {
      resultDetailsJson = _json["result_details_json"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (buildIds != null) {
      _json["build_ids"] = buildIds;
    }
    if (resultDetailsJson != null) {
      _json["result_details_json"] = resultDetailsJson;
    }
    return _json;
  }
}

class ApiCancelBatchResponseMessage {
  core.List<ApiCancelBatchResponseMessageOneResult> results;

  ApiCancelBatchResponseMessage();

  ApiCancelBatchResponseMessage.fromJson(core.Map _json) {
    if (_json.containsKey("results")) {
      results = _json["results"]
          .map((value) =>
              new ApiCancelBatchResponseMessageOneResult.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (results != null) {
      _json["results"] = results.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ApiCancelBatchResponseMessageOneResult {
  /// Describes model.Build, see its docstring.
  ApiCommonBuildMessage build;
  core.String buildId;
  ApiErrorMessage error;

  ApiCancelBatchResponseMessageOneResult();

  ApiCancelBatchResponseMessageOneResult.fromJson(core.Map _json) {
    if (_json.containsKey("build")) {
      build = new ApiCommonBuildMessage.fromJson(_json["build"]);
    }
    if (_json.containsKey("build_id")) {
      buildId = _json["build_id"];
    }
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (build != null) {
      _json["build"] = (build).toJson();
    }
    if (buildId != null) {
      _json["build_id"] = buildId;
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    return _json;
  }
}

class ApiCancelRequestBodyMessage {
  core.String resultDetailsJson;

  ApiCancelRequestBodyMessage();

  ApiCancelRequestBodyMessage.fromJson(core.Map _json) {
    if (_json.containsKey("result_details_json")) {
      resultDetailsJson = _json["result_details_json"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (resultDetailsJson != null) {
      _json["result_details_json"] = resultDetailsJson;
    }
    return _json;
  }
}

/// Describes model.Build, see its docstring.
class ApiCommonBuildMessage {
  core.String bucket;
  core.bool canary;

  ///
  /// Possible string values are:
  /// - "AUTO"
  /// - "CANARY"
  /// - "PROD"
  core.String canaryPreference;

  ///
  /// Possible string values are:
  /// - "CANCELED_EXPLICITLY"
  /// - "TIMEOUT"
  core.String cancelationReason;
  core.String completedTs;
  core.String createdBy;
  core.String createdTs;

  ///
  /// Possible string values are:
  /// - "BUILDBUCKET_FAILURE"
  /// - "BUILD_FAILURE"
  /// - "INFRA_FAILURE"
  /// - "INVALID_BUILD_DEFINITION"
  core.String failureReason;
  core.String id;
  core.String leaseExpirationTs;
  core.String leaseKey;
  core.String parametersJson;

  ///
  /// Possible string values are:
  /// - "CANCELED"
  /// - "FAILURE"
  /// - "SUCCESS"
  core.String result;
  core.String resultDetailsJson;
  core.String retryOf;
  core.String startedTs;

  ///
  /// Possible string values are:
  /// - "COMPLETED"
  /// - "SCHEDULED"
  /// - "STARTED"
  core.String status;
  core.String statusChangedTs;
  core.List<core.String> tags;
  core.String updatedTs;
  core.String url;
  core.String utcnowTs;

  ApiCommonBuildMessage();

  ApiCommonBuildMessage.fromJson(core.Map _json) {
    if (_json.containsKey("bucket")) {
      bucket = _json["bucket"];
    }
    if (_json.containsKey("canary")) {
      canary = _json["canary"];
    }
    if (_json.containsKey("canary_preference")) {
      canaryPreference = _json["canary_preference"];
    }
    if (_json.containsKey("cancelation_reason")) {
      cancelationReason = _json["cancelation_reason"];
    }
    if (_json.containsKey("completed_ts")) {
      completedTs = _json["completed_ts"];
    }
    if (_json.containsKey("created_by")) {
      createdBy = _json["created_by"];
    }
    if (_json.containsKey("created_ts")) {
      createdTs = _json["created_ts"];
    }
    if (_json.containsKey("failure_reason")) {
      failureReason = _json["failure_reason"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
    if (_json.containsKey("lease_key")) {
      leaseKey = _json["lease_key"];
    }
    if (_json.containsKey("parameters_json")) {
      parametersJson = _json["parameters_json"];
    }
    if (_json.containsKey("result")) {
      result = _json["result"];
    }
    if (_json.containsKey("result_details_json")) {
      resultDetailsJson = _json["result_details_json"];
    }
    if (_json.containsKey("retry_of")) {
      retryOf = _json["retry_of"];
    }
    if (_json.containsKey("started_ts")) {
      startedTs = _json["started_ts"];
    }
    if (_json.containsKey("status")) {
      status = _json["status"];
    }
    if (_json.containsKey("status_changed_ts")) {
      statusChangedTs = _json["status_changed_ts"];
    }
    if (_json.containsKey("tags")) {
      tags = _json["tags"];
    }
    if (_json.containsKey("updated_ts")) {
      updatedTs = _json["updated_ts"];
    }
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
    if (_json.containsKey("utcnow_ts")) {
      utcnowTs = _json["utcnow_ts"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (bucket != null) {
      _json["bucket"] = bucket;
    }
    if (canary != null) {
      _json["canary"] = canary;
    }
    if (canaryPreference != null) {
      _json["canary_preference"] = canaryPreference;
    }
    if (cancelationReason != null) {
      _json["cancelation_reason"] = cancelationReason;
    }
    if (completedTs != null) {
      _json["completed_ts"] = completedTs;
    }
    if (createdBy != null) {
      _json["created_by"] = createdBy;
    }
    if (createdTs != null) {
      _json["created_ts"] = createdTs;
    }
    if (failureReason != null) {
      _json["failure_reason"] = failureReason;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    if (leaseKey != null) {
      _json["lease_key"] = leaseKey;
    }
    if (parametersJson != null) {
      _json["parameters_json"] = parametersJson;
    }
    if (result != null) {
      _json["result"] = result;
    }
    if (resultDetailsJson != null) {
      _json["result_details_json"] = resultDetailsJson;
    }
    if (retryOf != null) {
      _json["retry_of"] = retryOf;
    }
    if (startedTs != null) {
      _json["started_ts"] = startedTs;
    }
    if (status != null) {
      _json["status"] = status;
    }
    if (statusChangedTs != null) {
      _json["status_changed_ts"] = statusChangedTs;
    }
    if (tags != null) {
      _json["tags"] = tags;
    }
    if (updatedTs != null) {
      _json["updated_ts"] = updatedTs;
    }
    if (url != null) {
      _json["url"] = url;
    }
    if (utcnowTs != null) {
      _json["utcnow_ts"] = utcnowTs;
    }
    return _json;
  }
}

class ApiDeleteManyBuildsResponse {
  ApiErrorMessage error;

  ApiDeleteManyBuildsResponse();

  ApiDeleteManyBuildsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    return _json;
  }
}

class ApiErrorMessage {
  core.String message;

  ///
  /// Possible string values are:
  /// - "BUILD_IS_COMPLETED"
  /// - "BUILD_NOT_FOUND"
  /// - "CANNOT_LEASE_BUILD"
  /// - "INVALID_BUILD_STATE"
  /// - "INVALID_INPUT"
  /// - "LEASE_EXPIRED"
  core.String reason;

  ApiErrorMessage();

  ApiErrorMessage.fromJson(core.Map _json) {
    if (_json.containsKey("message")) {
      message = _json["message"];
    }
    if (_json.containsKey("reason")) {
      reason = _json["reason"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (message != null) {
      _json["message"] = message;
    }
    if (reason != null) {
      _json["reason"] = reason;
    }
    return _json;
  }
}

class ApiFailRequestBodyMessage {
  ///
  /// Possible string values are:
  /// - "BUILDBUCKET_FAILURE"
  /// - "BUILD_FAILURE"
  /// - "INFRA_FAILURE"
  /// - "INVALID_BUILD_DEFINITION"
  core.String failureReason;
  core.String leaseKey;
  core.List<core.String> newTags;
  core.String resultDetailsJson;
  core.String url;

  ApiFailRequestBodyMessage();

  ApiFailRequestBodyMessage.fromJson(core.Map _json) {
    if (_json.containsKey("failure_reason")) {
      failureReason = _json["failure_reason"];
    }
    if (_json.containsKey("lease_key")) {
      leaseKey = _json["lease_key"];
    }
    if (_json.containsKey("new_tags")) {
      newTags = _json["new_tags"];
    }
    if (_json.containsKey("result_details_json")) {
      resultDetailsJson = _json["result_details_json"];
    }
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (failureReason != null) {
      _json["failure_reason"] = failureReason;
    }
    if (leaseKey != null) {
      _json["lease_key"] = leaseKey;
    }
    if (newTags != null) {
      _json["new_tags"] = newTags;
    }
    if (resultDetailsJson != null) {
      _json["result_details_json"] = resultDetailsJson;
    }
    if (url != null) {
      _json["url"] = url;
    }
    return _json;
  }
}

class ApiHeartbeatBatchRequestMessage {
  core.List<ApiHeartbeatBatchRequestMessageOneHeartbeat> heartbeats;

  ApiHeartbeatBatchRequestMessage();

  ApiHeartbeatBatchRequestMessage.fromJson(core.Map _json) {
    if (_json.containsKey("heartbeats")) {
      heartbeats = _json["heartbeats"]
          .map((value) =>
              new ApiHeartbeatBatchRequestMessageOneHeartbeat.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (heartbeats != null) {
      _json["heartbeats"] =
          heartbeats.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ApiHeartbeatBatchRequestMessageOneHeartbeat {
  core.String buildId;
  core.String leaseExpirationTs;
  core.String leaseKey;

  ApiHeartbeatBatchRequestMessageOneHeartbeat();

  ApiHeartbeatBatchRequestMessageOneHeartbeat.fromJson(core.Map _json) {
    if (_json.containsKey("build_id")) {
      buildId = _json["build_id"];
    }
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
    if (_json.containsKey("lease_key")) {
      leaseKey = _json["lease_key"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (buildId != null) {
      _json["build_id"] = buildId;
    }
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    if (leaseKey != null) {
      _json["lease_key"] = leaseKey;
    }
    return _json;
  }
}

class ApiHeartbeatBatchResponseMessage {
  core.List<ApiHeartbeatBatchResponseMessageOneHeartbeatResult> results;

  ApiHeartbeatBatchResponseMessage();

  ApiHeartbeatBatchResponseMessage.fromJson(core.Map _json) {
    if (_json.containsKey("results")) {
      results = _json["results"]
          .map((value) =>
              new ApiHeartbeatBatchResponseMessageOneHeartbeatResult.fromJson(
                  value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (results != null) {
      _json["results"] = results.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ApiHeartbeatBatchResponseMessageOneHeartbeatResult {
  core.String buildId;
  ApiErrorMessage error;
  core.String leaseExpirationTs;

  ApiHeartbeatBatchResponseMessageOneHeartbeatResult();

  ApiHeartbeatBatchResponseMessageOneHeartbeatResult.fromJson(core.Map _json) {
    if (_json.containsKey("build_id")) {
      buildId = _json["build_id"];
    }
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (buildId != null) {
      _json["build_id"] = buildId;
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    return _json;
  }
}

class ApiHeartbeatRequestBodyMessage {
  core.String leaseExpirationTs;
  core.String leaseKey;

  ApiHeartbeatRequestBodyMessage();

  ApiHeartbeatRequestBodyMessage.fromJson(core.Map _json) {
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
    if (_json.containsKey("lease_key")) {
      leaseKey = _json["lease_key"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    if (leaseKey != null) {
      _json["lease_key"] = leaseKey;
    }
    return _json;
  }
}

class ApiLeaseRequestBodyMessage {
  core.String leaseExpirationTs;

  ApiLeaseRequestBodyMessage();

  ApiLeaseRequestBodyMessage.fromJson(core.Map _json) {
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    return _json;
  }
}

class ApiLongestPendingTimeResponse {
  ApiErrorMessage error;
  core.double longestPendingTimeSec;

  ApiLongestPendingTimeResponse();

  ApiLongestPendingTimeResponse.fromJson(core.Map _json) {
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
    if (_json.containsKey("longest_pending_time_sec")) {
      longestPendingTimeSec = _json["longest_pending_time_sec"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (longestPendingTimeSec != null) {
      _json["longest_pending_time_sec"] = longestPendingTimeSec;
    }
    return _json;
  }
}

class ApiPauseResponse {
  ApiPauseResponse();

  ApiPauseResponse.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

class ApiPubSubCallbackMessage {
  core.String authToken;
  core.String topic;
  core.String userData;

  ApiPubSubCallbackMessage();

  ApiPubSubCallbackMessage.fromJson(core.Map _json) {
    if (_json.containsKey("auth_token")) {
      authToken = _json["auth_token"];
    }
    if (_json.containsKey("topic")) {
      topic = _json["topic"];
    }
    if (_json.containsKey("user_data")) {
      userData = _json["user_data"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (authToken != null) {
      _json["auth_token"] = authToken;
    }
    if (topic != null) {
      _json["topic"] = topic;
    }
    if (userData != null) {
      _json["user_data"] = userData;
    }
    return _json;
  }
}

class ApiPutBatchRequestMessage {
  core.List<ApiPutRequestMessage> builds;

  ApiPutBatchRequestMessage();

  ApiPutBatchRequestMessage.fromJson(core.Map _json) {
    if (_json.containsKey("builds")) {
      builds = _json["builds"]
          .map((value) => new ApiPutRequestMessage.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (builds != null) {
      _json["builds"] = builds.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ApiPutBatchResponseMessage {
  ApiErrorMessage error;
  core.List<ApiPutBatchResponseMessageOneResult> results;

  ApiPutBatchResponseMessage();

  ApiPutBatchResponseMessage.fromJson(core.Map _json) {
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
    if (_json.containsKey("results")) {
      results = _json["results"]
          .map((value) =>
              new ApiPutBatchResponseMessageOneResult.fromJson(value))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (results != null) {
      _json["results"] = results.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class ApiPutBatchResponseMessageOneResult {
  /// Describes model.Build, see its docstring.
  ApiCommonBuildMessage build;
  core.String clientOperationId;
  ApiErrorMessage error;

  ApiPutBatchResponseMessageOneResult();

  ApiPutBatchResponseMessageOneResult.fromJson(core.Map _json) {
    if (_json.containsKey("build")) {
      build = new ApiCommonBuildMessage.fromJson(_json["build"]);
    }
    if (_json.containsKey("client_operation_id")) {
      clientOperationId = _json["client_operation_id"];
    }
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (build != null) {
      _json["build"] = (build).toJson();
    }
    if (clientOperationId != null) {
      _json["client_operation_id"] = clientOperationId;
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    return _json;
  }
}

class ApiPutRequestMessage {
  core.String bucket;

  ///
  /// Possible string values are:
  /// - "AUTO"
  /// - "CANARY"
  /// - "PROD"
  core.String canaryPreference;
  core.String clientOperationId;
  core.String leaseExpirationTs;
  core.String parametersJson;
  ApiPubSubCallbackMessage pubsubCallback;
  core.List<core.String> tags;

  ApiPutRequestMessage();

  ApiPutRequestMessage.fromJson(core.Map _json) {
    if (_json.containsKey("bucket")) {
      bucket = _json["bucket"];
    }
    if (_json.containsKey("canary_preference")) {
      canaryPreference = _json["canary_preference"];
    }
    if (_json.containsKey("client_operation_id")) {
      clientOperationId = _json["client_operation_id"];
    }
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
    if (_json.containsKey("parameters_json")) {
      parametersJson = _json["parameters_json"];
    }
    if (_json.containsKey("pubsub_callback")) {
      pubsubCallback =
          new ApiPubSubCallbackMessage.fromJson(_json["pubsub_callback"]);
    }
    if (_json.containsKey("tags")) {
      tags = _json["tags"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (bucket != null) {
      _json["bucket"] = bucket;
    }
    if (canaryPreference != null) {
      _json["canary_preference"] = canaryPreference;
    }
    if (clientOperationId != null) {
      _json["client_operation_id"] = clientOperationId;
    }
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    if (parametersJson != null) {
      _json["parameters_json"] = parametersJson;
    }
    if (pubsubCallback != null) {
      _json["pubsub_callback"] = (pubsubCallback).toJson();
    }
    if (tags != null) {
      _json["tags"] = tags;
    }
    return _json;
  }
}

class ApiRetryRequestMessage {
  core.String clientOperationId;
  core.String leaseExpirationTs;
  ApiPubSubCallbackMessage pubsubCallback;

  ApiRetryRequestMessage();

  ApiRetryRequestMessage.fromJson(core.Map _json) {
    if (_json.containsKey("client_operation_id")) {
      clientOperationId = _json["client_operation_id"];
    }
    if (_json.containsKey("lease_expiration_ts")) {
      leaseExpirationTs = _json["lease_expiration_ts"];
    }
    if (_json.containsKey("pubsub_callback")) {
      pubsubCallback =
          new ApiPubSubCallbackMessage.fromJson(_json["pubsub_callback"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (clientOperationId != null) {
      _json["client_operation_id"] = clientOperationId;
    }
    if (leaseExpirationTs != null) {
      _json["lease_expiration_ts"] = leaseExpirationTs;
    }
    if (pubsubCallback != null) {
      _json["pubsub_callback"] = (pubsubCallback).toJson();
    }
    return _json;
  }
}

class ApiSearchResponseMessage {
  /// Describes model.Build, see its docstring.
  core.List<ApiCommonBuildMessage> builds;
  ApiErrorMessage error;
  core.String nextCursor;

  ApiSearchResponseMessage();

  ApiSearchResponseMessage.fromJson(core.Map _json) {
    if (_json.containsKey("builds")) {
      builds = _json["builds"]
          .map((value) => new ApiCommonBuildMessage.fromJson(value))
          .toList();
    }
    if (_json.containsKey("error")) {
      error = new ApiErrorMessage.fromJson(_json["error"]);
    }
    if (_json.containsKey("next_cursor")) {
      nextCursor = _json["next_cursor"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (builds != null) {
      _json["builds"] = builds.map((value) => (value).toJson()).toList();
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (nextCursor != null) {
      _json["next_cursor"] = nextCursor;
    }
    return _json;
  }
}

class ApiStartRequestBodyMessage {
  core.bool canary;
  core.String leaseKey;
  core.String url;

  ApiStartRequestBodyMessage();

  ApiStartRequestBodyMessage.fromJson(core.Map _json) {
    if (_json.containsKey("canary")) {
      canary = _json["canary"];
    }
    if (_json.containsKey("lease_key")) {
      leaseKey = _json["lease_key"];
    }
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (canary != null) {
      _json["canary"] = canary;
    }
    if (leaseKey != null) {
      _json["lease_key"] = leaseKey;
    }
    if (url != null) {
      _json["url"] = url;
    }
    return _json;
  }
}

class ApiSucceedRequestBodyMessage {
  core.String leaseKey;
  core.List<core.String> newTags;
  core.String resultDetailsJson;
  core.String url;

  ApiSucceedRequestBodyMessage();

  ApiSucceedRequestBodyMessage.fromJson(core.Map _json) {
    if (_json.containsKey("lease_key")) {
      leaseKey = _json["lease_key"];
    }
    if (_json.containsKey("new_tags")) {
      newTags = _json["new_tags"];
    }
    if (_json.containsKey("result_details_json")) {
      resultDetailsJson = _json["result_details_json"];
    }
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (leaseKey != null) {
      _json["lease_key"] = leaseKey;
    }
    if (newTags != null) {
      _json["new_tags"] = newTags;
    }
    if (resultDetailsJson != null) {
      _json["result_details_json"] = resultDetailsJson;
    }
    if (url != null) {
      _json["url"] = url;
    }
    return _json;
  }
}
