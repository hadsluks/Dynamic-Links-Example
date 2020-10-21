import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share/share.dart';

Future<String> getUrl(String param1, String param2, String param3) async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://dlex.page.link',
    link:
        Uri.parse('https://dlex.com/answerTest?param=$param1,$param2,$param3'),
    androidParameters: AndroidParameters(
      packageName: 'com.example.dynamicLinksExample',
    ),
    /* socialMetaTagParameters: SocialMetaTagParameters(
        title: testId,
      ), */
  );
  final Uri dynamicUrl = await parameters.buildUrl();
  //final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
  return dynamicUrl.toString();
}

void shareUrl(String url) {
  Share.share(url);
}

void initFirebaseDynamicUrlPlugin() async {
  final PendingDynamicLinkData data =
      await FirebaseDynamicLinks.instance.getInitialLink();
  final Uri deepLink = data?.link;

  if (deepLink != null) {
    String param = deepLink.queryParameters["param"];
    String param1 = param.split(",")[0],
        param2 = param.split(",")[1],
        param3 = param.split(",")[3];
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("Parameters are: ");
    print("Parameter 1: $param1");
    print("Parameter 2: $param2");
    print("Parameter 3: $param3");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  }
  FirebaseDynamicLinks.instance.onLink(
    onSuccess: (PendingDynamicLinkData linkData) async {
      final Uri deepLink = linkData?.link;
      if (deepLink != null) {
        String param = deepLink.queryParameters["param"];
        String param1 = param.split(",")[0],
            param2 = param.split(",")[1],
            param3 = param.split(",")[3];
        print(
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("Parameters are: ");
        print("Parameter 1: $param1");
        print("Parameter 2: $param2");
        print("Parameter 3: $param3");
        print(
            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      }
    },
    onError: (OnLinkErrorException e) async {
      print('onLinkError $e');
    },
  );
}
