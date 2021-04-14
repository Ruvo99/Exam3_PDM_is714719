part of 'upload_bloc.dart';

abstract class UploadState extends Equatable {
  const UploadState();
  
  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

class LoadingState extends UploadState {}

class SavedNewState extends UploadState {}

class PickedImageState extends UploadState {
  final File image;

  PickedImageState({@required this.image});
  @override
  List<Object> get props => [image];
}

class ErrorMessageState extends UploadState {
  final String errorMsg;

  ErrorMessageState({@required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
