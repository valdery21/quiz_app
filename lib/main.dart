import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'helper.dart';

// ignore_for_file: avoid_print
Helper helper = Helper();

void main() => runApp(const QuizzApp());

class QuizzApp extends StatelessWidget {
  const QuizzApp({Key key}) : super(key: key);

  //const QuizzApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(helper.obterQuestao);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> marcadorDePontos = [];

  void conferirResposta(bool respostaSelecionadaPeloUsuario) {
    bool respostaCerta = helper.obterRespostaCorreta();
    setState(() {
      //TODO: Passo 4 - Use o IF/ELSE para verificar se chegou-se ao fim do quiz. Se isso for verdadeiro (true), siga os passos: 4.a, 4.b, 4.c e 4.d.
      if (helper.confereFimDaExecucao() == true) {
        //TODO: Passo 4.a) - Mostre um alerta utilizando o pacote rflutter_alert (se ficar em dúvida dê uma olhada na documentação do pacote: https://pub.dev/packages/rflutter_alert).

        Alert(
          context: context,
          title: 'Fim do Quiz!',
          desc: 'Você respondeu a todas as perguntas.',
          buttons: [
            DialogButton(
              child: const Text(
                "Início",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        //TODO: Passo 4.c) - Reinicie o valor da propriedade _numeroDaQuestaoAtual.
        helper.resetarQuiz();

        //TODO: Passo 4.d) - Esvazie a lista marcadorDePontos para uma nova rodada.
        marcadorDePontos = [];
      }

      //TODO: Passo 5 - 'Se' não for o fim da execução do app ainda, ou seja, se não estivermos na última questão, entre na estrutura condicional e continue com a verificação da resposta.
      else {
        if (respostaSelecionadaPeloUsuario == respostaCerta) {
          marcadorDePontos.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          marcadorDePontos.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        helper.proximaPergunta();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                ' ${helper.obterQuestao()} ',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Background color
              ),
              child: const Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                conferirResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 92, 92, 92), // Background color
              ),
              child: const Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                conferirResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        )
      ],
    );
  }
}
