
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_bloc.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_event.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_state.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {

  @override
  void initState(){
    super.initState();
    context.read<NewsBloc>().add(FetchPopular());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            BlocBuilder<NewsBloc,NewsState>(
          builder: (context,state){
            if(state is InitialNewsState){
              return const CircularProgressIndicator();
            }
            else if(state is LoadPopularNewsState){
               final trendings = state.someRootEntity.results??[];
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: trendings.length,
                    itemBuilder: (context,index){
                    final trending = trendings[index];
                    return Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(trending.title??'no title'),
                    );
                }
                ),
              );
            }
            else {
              return const SizedBox();
            }

            }
            )
            ],
          ),
        ),
      ),
    );
  }
}
