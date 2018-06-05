# Steps for re-Generating the buildbucket client API stubs

### Downloading the latest discovery apis description of the API

The API description is available via a discovery api description json file,
which can be obtained via:

```
% curl https://cr-buildbucket.appspot.com/_ah/api/discovery/v1/apis/buildbucket/v1/rest -o discovery/buildbucket.json
```

### Generating an API package from the discovery api description

The [package:discoveryapis_generator](https://pub.dartlang.org/packages/discoveryapis_generator)
can be used to generate a Dart client stubs package for the API as follows.

```
% pub global activate discoveryapis_generator
...

% pub global run discoveryapis_generator:generate package -i discovery -o api-package --package-name=buildbucket
[SUCCESS] buildbucket v1 @ package:buildbucket/buildbucket/v1.dart
1 succeeded, 0 failed.

% cp api-package/lib/buildbucket/v1.dart lib/buildbucket.dart
% cp api-package/test/buildbucket/v1_test.dart test/buildbucket/v1_test.dart
% sed -i 's#package:buildbucket/buildbucket/v1.dart#package:buildbucket/buildbucket.dart#g' test/buildbucket/v1_test.dart

% rm -r api-package

% pub get
% pub run test
```
