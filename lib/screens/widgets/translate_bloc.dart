import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translater/repo/repo_text.dart';

// События
abstract class TranslateEvent {}

class TranslateTextEvent extends TranslateEvent {
  final String text;
  final String? sourceLanguage; // Добавлено поле для языка источника
  final String? targetLanguage; // Добавлено поле для целевого языка

  TranslateTextEvent(this.text, {this.sourceLanguage, this.targetLanguage});
}

// Состояния
abstract class TranslateState {}

class TranslatedState extends TranslateState {
  final String translatedText;

  TranslatedState(this.translatedText);
}

class ErrorState extends TranslateState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

// BLoC
class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  final RepoTranslate repoTranslate;

  TranslateBloc(this.repoTranslate) : super(TranslatedState(''));

  @override
  @override
  Stream<TranslateState> mapEventToState(TranslateEvent event) async* {
    if (event is TranslateTextEvent) {
      try {
        final textResponse = await repoTranslate.translate(
          event.text,
          event.sourceLanguage ?? 'auto',
          event.targetLanguage ?? 'ru',
        );
        final resList =
            textResponse.dataText?.data.translations.first.translatedText;
        if (resList != null) {
          yield TranslatedState(resList);
        } else {
          yield ErrorState('Ошибка при переводе текста');
        }
      } catch (e) {
        yield ErrorState('Ошибка при переводе текста: $e');
      }
    }
  }
}
