import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_bloc.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_event.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_state.dart';
import 'package:news_app/Screens/most_popular.dart';
import 'package:news_app/Screens/news_detailed_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(NewsFetchApi());


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(child:  Text('Breaking News')),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is InitialNewsState) {
                    return const SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50.0,
                    );
                  } else if (state is LoadedNewsState) {
                    final results = state.news.results ?? [];
                    return SizedBox(
                      height: 800,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: results.length,
                          itemBuilder: (context, index) {
                            final res = results[index];
                            final multimedia = res.multimedia ?? [];
                            if (multimedia.isNotEmpty) {
          
                              final url= multimedia.first.url??'no url';
                              final caption= multimedia.first.caption??'no caption';
                              final detailed= res.abstract??'no url';
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailedScreen(url: url, caption: caption,detailed:detailed)));
                                  },
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 390,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: Image.network(
                                           url,
                                            fit: BoxFit.cover,
                                            height: 300,
                                            errorBuilder: (context, error, stackTrace) {
                                              return const Center(child: Text('Image not available'));
                                            },
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 200,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child:  Text(
                                            caption,
                                            style: const   TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: Text('No multimedia available'),
                              );
                            }
                          },
                        ),
                    );
                  }
                  else if (state is ErrorNewsState) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),

            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const  MostPopular()));
          },
          child: Container(
            color: Colors.lightBlueAccent,
            height: 45,
            width: 200,
            child: const Center(
                child:  Text('#1 on Trending',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            )
            ),
          ),
        ),


      ),
    );
  }
}
