import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _keywordsController = TextEditingController();

  String _selectedLanguage = 'English';
  String _selectedVerses = '1';
  String _selectedLinesInVerses = '1';
  String _selectedBridges = '1';
  String _selectedLinesInBridge = '1';
  String _selectedChorus = '1';
  String _selectedNumberOfChoruses = '1';
  String _selectedGenre = 'Pop';

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Hindi',
    'Bengali'
  ];
  final List<String> _genres = ['Pop', 'Rock', 'Jazz', 'Classical'];
  final List<String> _numbers = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    final textGenerator = Provider.of<TextGenerator>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Geeti: Lyrics Generator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: _languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    color: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
            TextField(
              controller: _keywordsController,
              decoration: InputDecoration(
                labelText: 'Enter keywords:',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Genre of song:'),
                  DropdownButton<String>(
                    value: _selectedGenre,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGenre = newValue!;
                      });
                    },
                    items:
                        _genres.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: Colors.orangeAccent,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Number of verses:'),
                        DropdownButton<String>(
                          value: _selectedVerses,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedVerses = newValue!;
                            });
                          },
                          items: _numbers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                color: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Number of choruses:'),
                        DropdownButton<String>(
                          value: _selectedNumberOfChoruses,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedNumberOfChoruses = newValue!;
                            });
                          },
                          items: _numbers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                color: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Number of bridges:'),
                        DropdownButton<String>(
                          value: _selectedBridges,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBridges = newValue!;
                            });
                          },
                          items: _numbers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                color: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lines per verse:'),
                        DropdownButton<String>(
                          value: _selectedLinesInVerses,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLinesInVerses = newValue!;
                            });
                          },
                          items: _numbers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                color: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lines in chorus:'),
                        DropdownButton<String>(
                          value: _selectedChorus,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedChorus = newValue!;
                            });
                          },
                          items: _numbers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                color: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lines per bridge:'),
                        DropdownButton<String>(
                          value: _selectedLinesInBridge,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLinesInBridge = newValue!;
                            });
                          },
                          items: _numbers
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                color: Colors.orangeAccent,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                textGenerator.generateText(
                  _selectedLanguage,
                  _keywordsController.text,
                  _selectedGenre,
                  int.parse(_selectedVerses),
                  int.parse(_selectedLinesInVerses),
                  int.parse(_selectedBridges),
                  int.parse(_selectedLinesInBridge),
                  int.parse(_selectedChorus),
                  int.parse(_selectedNumberOfChoruses),
                );
              },
              child: Text('Generate Lyrics'),
            ),
            SizedBox(height: 20),
            MarkdownBody(
              data: textGenerator.generatedText,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextGenerator extends ChangeNotifier {
  String _generatedText = '';

  String get generatedText => _generatedText;

  Future<void> generateText(
    String language,
    String keywords,
    String genre,
    int verses,
    int linesInVerses,
    int bridges,
    int linesInBridge,
    int chorus,
    int numberOfChoruses,
  ) async {
    final apiKey = '';

    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final prompt =
        'Write the lyrics for a $genre song in $language that includes the following themes: $keywords. '
        'The song should have $verses verses, with each verse having $linesInVerses lines. '
        'It should have $numberOfChoruses choruses, each with $chorus lines, and $bridges bridges, each with $linesInBridge lines.';
    final content = [Content.text(prompt)];
    try {
      final response = await model.generateContent(content);
      _generatedText = response.text ?? '';
      notifyListeners();
    } catch (error) {
      print('Error generating text: $error');
    }
  }
}
