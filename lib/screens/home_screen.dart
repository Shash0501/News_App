import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_bloc/bloc/news_bloc.dart';
import 'package:news_app/models/articleModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
          child: Column(children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
                margin: EdgeInsets.only(left: width * 0.03),
                child: Text("NEWS",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: 1,
              color: Colors.grey,
              width: width,
              margin: EdgeInsets.only(left: width * 0.01),
            )
          ]),
        ),
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: height * 0.08),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                print("NEWS LOADING STATE");
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsLoadedState) {
                print("News lOADED STATE");

                List<ArticleModel> _articlesList = [];
                _articlesList = state.articleList;
                print(_articlesList[0]);
                print("length ${_articlesList.length}");
                return ListView.builder(
                  itemCount: _articlesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                offset: Offset(0, 2),
                                spreadRadius: 1,
                              )
                            ]),
                        height: height * 0.15,
                        margin: EdgeInsets.only(
                            bottom: height * 0.02,
                            top: height * 0.02,
                            left: width * 0.02,
                            right: width * 0.02),
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        _articlesList[index].urlToImage),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Container(
                              width: width * 0.6,
                              height: height * 0.2,
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Text(_articlesList[index].title,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                            )
                          ],
                        ));
                  },
                );
              } else if (state is NewsErrorState) {
                return Center(
                  child: Text("${state.errorMessage}"),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ])),
    );
  }
}
