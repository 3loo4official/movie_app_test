import 'package:flutter/material.dart';

import 'controller.dart';

class MoviesScreen extends StatefulWidget {
  MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() {
    return _MoviesScreenState();
  }
}

class _MoviesScreenState extends State<MoviesScreen> {
  final controller = MovieDBController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await controller.getMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.model == null
          ? const Center(child:  CircularProgressIndicator())
          : ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              CircleAvatar(backgroundImage: NetworkImage("https://image.tmdb.org/t/p/original" +
                  controller.model!.movies[index].backdropPath,),
                backgroundColor: Colors.transparent,
                radius: 150,),
              SizedBox(height: 10,),
              Text(controller.model!.movies[index].title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
            ],
          ),
        ),
        itemCount: controller.model!.movies.length,
      ),
    );
  }
}
