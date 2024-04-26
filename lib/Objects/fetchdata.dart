import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

Future<String> fetchAnimalDescription(String animalName) async {
  final response = await http.get(
    Uri.parse(
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&titles=$animalName&exintro=1'),
    //'https://en.wikipedia.org/wiki/$animalName'),
  );

  if (response.statusCode == 200) {
    String animalDescription = '';
    //final htmldata = json.decode(response.body);
    //final pages = htmldata['query']['pages'] as Map<String, dynamic>;
    //final pageId = pages.keys.first;
    //var Extract = pages[pageId]['extract'];
    var document = parse(response.body);
    List<Element> pTags = document.getElementsByTagName('p');
    for (var tag in pTags) {
      animalDescription +=
          tag.text.replaceAll('\\n', '').replaceAll('\\\"', '\"');
    }
    print('fetching description is done boss');
    return animalDescription;
  } else {
    throw Exception('Failed to load animal description');
  }
}

// void main() async {
//   var response = await http.get('http://example.com');
//   var document = parse(response.body);
//   List<Element> pTags = document.getElementsByTagName('p');
//
//   for (var tag in pTags) {
//     print(tag.text);
//   }
// }
