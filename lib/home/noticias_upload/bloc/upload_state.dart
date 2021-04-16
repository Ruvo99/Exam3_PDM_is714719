part of 'upload_bloc.dart';

abstract class UploadState extends Equatable {
  const UploadState();
  
  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

//Cargando (Circular Progress Indicator)
class LoadingState extends UploadState {}

//Guardar noticia desde Pantalla 3
class SavedNewState extends UploadState {}

//Guardar noticia desde Pantalla 1
class SavedNewsApiState extends UploadState {}

//Imagen seleccionada
class PickedImageState extends UploadState {
  final File image;

  PickedImageState({@required this.image});
  @override
  List<Object> get props => [image];
}

//Mensaje de error
class ErrorMessageState extends UploadState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
