import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_login/home/noticias_ext_api/bloc/searching_bloc.dart';
import 'item_noticia.dart';

class NoticiasDeportes extends StatefulWidget {
  const NoticiasDeportes({Key key}) : super(key: key);

  @override
  _NoticiasDeportesState createState() => _NoticiasDeportesState();
}

class _NoticiasDeportesState extends State<NoticiasDeportes> {
  var query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchingBloc, SearchingState>(
      listener: (context, state) {
        if (state is LoadNewsApiState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Cargando noticias...'),
              ),
            );
        } else if (state is ErrorNewsApiState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Error al cargar noticias'),
              ),
            );
          print(state.error);
        }
      },
      builder: (context, state) {
        if (state is LoadedNewsApiState) {
          if (state.apiNewsList.length == 0) {
            return Column(
              children: [
                SearchBar(query: query),
                Center(
                  child: Text('No hay noticias para mostrar'),
                ),
              ],
            );
          } else if (state.apiNewsList.length > 0) {
            return Column(
              children: [
                SearchBar(query: query),
                _newsApi(state.apiNewsList),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchBar(query: query),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _newsApi(newsList) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return ItemNoticia(
              noticia: newsList[index],
            );
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key key, @required this.query}) : super(key: key);

  final TextEditingController query;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: query,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          MaterialButton(child:Text('Search'),onPressed: () {
            BlocProvider.of<SearchingBloc>(context).add(
              RequestWithQueryEvent(query: query.text),
            );
          })
        ],
      ),
    );
  }
}
