import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:clipboard/clipboard.dart';

class funs {
  static Future<void> openInBrowser(String Link) async {
    if (await canLaunch(Link)) {
      await launch(Link);
    } else {
      print('Could not launch $Link');
    }
  }

  static Future<void> shareLink(String Link) async {
    Share.share('check out $Link');
  }

  static Future<void> copyLink(String Link) async {
    FlutterClipboard.copy('$Link').then((value) => print('copied'));
  }
}
