import 'perguntas.dart';
import 'main.dart';

class Helper {
  int _numeroDaQuestaoAtual = 0;
  // ignore: prefer_final_fields
  List<Perguntas> _bancoDePerguntas = [
    Perguntas(
        'O metrô é um dos meios de transporte mais seguros do mundo.', true),
    Perguntas('A culinária brasileira é uma das melhores do mundo.', true),
    Perguntas('Vacas podem voar, assim como peixes utilizam os pés para andar.',
        false),
    Perguntas('A maioria dos peixes podem viver fora da água.', false),
    Perguntas('A lâmpada foi inventada por um brasileiro.', false),
    Perguntas(
        'É possível utilizar a carteira de habilitação de carro para dirigir um avião.',
        false),
    Perguntas('O Brasil possui 26 estados e 1 Distrito Federal.', true),
    Perguntas(
        'Bitcoin é o nome dado a uma das moedas virtuais mais famosas.', true),
    Perguntas('1 minuto equivale a 60 segundos.', true),
    Perguntas('1 segundo equivale a 200 milissegundos.', false),
    Perguntas(
        'O Burj Khalifa, em Dubai, é considerado o maior prédio do mundo.',
        true),
    Perguntas('Ler após uma refeição prejudica a visão humana.', false),
    Perguntas(
        'O cartão de crédito pode ser considerado uma moeda virtual.', false),
  ];

  void proximaPergunta() {
    if (_numeroDaQuestaoAtual < _bancoDePerguntas.length - 1) {
      _numeroDaQuestaoAtual++;
    }
    print(_numeroDaQuestaoAtual);
    print(_bancoDePerguntas.length);
  }

// ignore_for_file: avoid_print
  String obterQuestao() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].questao;
  }

  bool obterRespostaCorreta() {
    return _bancoDePerguntas[_numeroDaQuestaoAtual].respostaDaQuestao;
  }

  confereFimDaExecucao() {
    if (_numeroDaQuestaoAtual >= _bancoDePerguntas.length - 1) {
      print('Chegou na última pergunta do quiz');

      return true;
    } else {
      return false;
    }
  }

  //TODO: Passo 4.b) - Crie um método para resetar o valor da propriedade _numeroDaQuestaoAtual para 0, quando for necessário.

  resetarQuiz() {
    _numeroDaQuestaoAtual = 0;
  }
}
