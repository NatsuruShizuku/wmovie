import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wmovie/data.dart';
import 'package:wmovie/constants.dart';
import 'package:wmovie/movie_detail.dart';

class wmovie extends StatefulWidget {
  @override
  _wmovieState createState() => _wmovieState();
}

class _wmovieState extends State<wmovie> {

  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  List<Movie> movies = getMovieList();
  List<Director> directors = getDirectorList();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(
          Icons.sort,
          color: kPrimaryColor,
          size: 28,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16,),
            child: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 12,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "New Movie",
                  style: GoogleFonts.catamaran(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    height: 1,
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buildFilters(),
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildMovies(),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "directors to follow",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      Row(
                        children: [

                          Text(
                            "Show all",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),

                          SizedBox(
                            width: 8,
                          ),

                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: kPrimaryColor,
                          ),

                        ],
                      ),

                    ],
                  ),
                ),

                Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 16),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildDirectors(),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> buildFilters(){
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

  Widget buildFilter(Filter item){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = item;
        });
      },
      child: Container(
        height: 50,
        child: Stack(
          children: <Widget>[

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 30,
                height: 3,
                color: selectedFilter == item ? kPrimaryColor : Colors.transparent,
              ),
            ),

            Center(
              child: Text(
                item.name,
                style: GoogleFonts.catamaran(
                  color: selectedFilter == item ? kPrimaryColor : Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  List<Widget> buildMovies(){
    List<Widget> list = [];
    for (var i = 0; i < movies.length; i++) {
      list.add(buildMovie(movies[i], i));
    }
    return list;
  }

  Widget buildMovie(Movie movie, int index){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetail(movie: movie)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 32, left: index == 0 ? 16 : 0, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 12,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(bottom: 16, top: 24,),
                child: Hero(
                  tag: movie.title,
                  child: Image.asset(
                    movie.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

            Text(
              movie.title,
              style: GoogleFonts.catamaran(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              movie.director.fullname,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }

  List<Widget> buildDirectors(){
    List<Widget> list = [];
    for (var i = 0; i < directors.length; i++) {
      list.add(buildAuthor(directors[i], i));
    }
    return list;
  }

  Widget buildAuthor(Director author, int index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
      width: 255,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Card(
            elevation: 4,
            margin: EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(author.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 12,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                author.fullname,
                style: GoogleFonts.catamaran(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                children: [

                  Icon(
                    Icons.movie,
                    color: Colors.grey,
                    size: 14,
                  ),

                  SizedBox(
                    width: 8,
                  ),

                  Text(
                    author.movies.toString() + " movies",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

            ],
          ),

        ],
      ),
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Center(
          child: Icon(
            item.iconData,
            color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
            size: 28,
          ),
        ),
      ),
    );
  }

}