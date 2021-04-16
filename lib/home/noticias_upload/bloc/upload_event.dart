part of 'upload_bloc.dart';

abstract class UploadEvent extends Equatable {
  const UploadEvent();

  @override
  List<Object> get props => [];
}
//Inicio
class InitialUploadEvent extends UploadEvent {}

//Guardar noticias de pantalla 3
class SaveNewElementEvent extends UploadEvent {
  final New noticia;

  SaveNewElementEvent({@required this.noticia});
  @override
  List<Object> get props => [noticia];
}

//Guardar noticias de Pantalla 1
class SaveNewsApiEvent extends UploadEvent {
  final New noticia;

  SaveNewsApiEvent({@required this.noticia});
  @override
  List<Object> get props => [noticia];
}

//Elegir una imagen
class PickImageEvent extends UploadEvent {
  @override
  List<Object> get props => [];
}
