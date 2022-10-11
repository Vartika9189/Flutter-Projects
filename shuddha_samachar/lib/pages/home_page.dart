import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuddha_samachar/pages/categorised_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:english_words/english_words.dart' as english_words;


import '../models/catagory.dart';
import '../models/country_catagory.dart';
import '../models/default_news_model.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/home_widget_tile.dart';
import 'artical_web_page.dart';
import 'search_result_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Area> areas = <Area>[];
  List<Catagory> catagories = <Catagory>[];
  List<Newsdetails> newslist = <Newsdetails>[];
  final List<String> kEnglishWords;
  late _MySearchDelegate _delegate;


  _HomePageState()
      : kEnglishWords = List.from(Set.from(english_words.all))
          ..sort(
            (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
          ),
        super();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    areas = getArea();
    catagories = getCatagory();
    
    getNewsDetails();
    _delegate = _MySearchDelegate(kEnglishWords);
  }


  getNewsDetails() async {
    News newsClass = News();
    await newsClass.getNews();
    newslist = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const Icon(CupertinoIcons.news,color: Colors.blue,size: 40,).px12(),
            "शुद्ध ".text.amber500.xl2.bold.make(),
            "Samachar".text.blue900.xl4.extraBold.make(),
            
            ],),
            actions: <Widget>[
          IconButton(
            tooltip: 'Search a single keyword',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String? selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
            
            },
          ),
        ],

        ),


        body: 
        SafeArea(
          child: 
          _loading
          ?const LinearProgressIndicator()
          :SingleChildScrollView(
            child: Container(
                  color: const Color.fromARGB(255, 245, 239, 226),
                  child: 
                  Column(
                    children: 
                    [
                      Container(
                        height: 110,
                        child: 
                        ListView.builder(
          
                          shrinkWrap: true,
                          itemCount: areas.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return AreaCatagoryTile(
                              areaimage: areas[index].areaImageUrl, 
                              areaname: areas[index].areaName,
                              areaurl: areas[index].urltoarea
                            );
                          },
                        ),
                      ).px8(),
                      Container(
          
                      height: 50,
                      child: ListView.builder(
          
                        shrinkWrap: true,
                        itemCount: catagories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CatagoryTile(
                            caturl: catagories[index].url,
                            // areaimage: [index].areaImageUrl, 
                            catagoryName: catagories[index].catagoryName
                          );
                        },
                      ),
                    ).px8(),
                      
                      Row(
                        children: [
                                    "Top HeadLines".text.caption(context).xl3.make().px12().pOnly(top: 10)
                        ],
                      ),

                      Container(
                      
                      
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
          
                        shrinkWrap: true,
                        itemCount: newslist.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsTile(
                          
                            newsdetail: newslist[index],
          
          
          
                          );
                        },
                      ),
          
          
                      )
                    ]
                  )
              ),
          ),

    ),  
    drawer: const MyDrawer(),
    );
  }
}















class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>['apple', 'hello', 'world', 'flutter'],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, '');
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                Navigator.push(context, MaterialPageRoute(
          builder: ((context) => 
          SearchedPage(keyword: this.query,)
          ) )
        );
                // this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
             
            ),
            "Click On Above Text To Get Search Result".text.caption(context).make().py8()
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList(
      {required this.suggestions,
      required this.query,
      required this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle1!;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}