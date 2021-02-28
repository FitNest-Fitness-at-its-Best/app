import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/bloc/article/article_cubit.dart';
import '../../utils/global_themes.dart';
import '../widgets/article_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.07,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Text(
                'FITNEST',
                style: defaultText.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.15,
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: borderRadius5,
                child: ListTile(
                  tileColor: accentColor,
                  subtitle: Text(
                    'Your Health Score',
                    style: defaultText.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  title: Text(
                    'Siddhartha,',
                    style: defaultText.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "75",
                      style: defaultText.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<ArticleCubit, ArticleState>(
                listener: (context, state) {
                  if (state is ArticleErr) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(state.msg),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is ArticleInitial) {
                    BlocProvider.of<ArticleCubit>(context).getArticles();
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Articleloading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ArticleLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) => ArticleWidget(
                          article: state.articles[index],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
