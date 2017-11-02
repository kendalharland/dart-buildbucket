import 'package:buildbucket/buildbucket.dart';
import 'package:http/http.dart' as http;

/// Fetches and displays a few stats for the complete builds from a single
/// bucket.
/// Example usage: `dart example/fetch_bucket.dart luci.fuchsia.continuous`
main(List<String> args) async {
  final bucketName = args.first;

  print('Fetching bucket $bucketName');

  final api = new BuildbucketApi(new http.Client());
  final ApiSearchResponseMessage response = await api.search(
    bucket: [bucketName],
    status: 'COMPLETED',
  );

  for (var build in response.builds) {
    print('== BUILD: ${build.id}');
    print('STATUS: ${build.status}');
    print('RESULT: ${build.result}');
    if (build.result == 'FAILURE') {
      print('FAILURE_REASON: ${build.failureReason}');
    }
    print('URL: ${build.url}');
  }
}
