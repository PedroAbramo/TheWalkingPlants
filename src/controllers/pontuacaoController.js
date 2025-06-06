var pontuacaoModel = require("../models/pontuacaoModel");

function buscarEspecifico(req, res) {
  const dificuldade =req.query.dificuldade;
    pontuacaoModel.buscarEspecifico(dificuldade)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarGeral(req, res) {
      pontuacaoModel.buscarGeral()
      .then(function (resultado) {
          res.json(resultado);
      })
      .catch(function (erro) {
          console.log(erro);
          res.status(500).json(erro.sqlMessage);
      });
  }

  function cadastrarPontuacao(req, res) {
    const {nome, pontuacao, dificuldade} = req.body
        pontuacaoModel.cadastrarPontuacao(nome, pontuacao, dificuldade)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    
}

module.exports = {
    buscarEspecifico,
    buscarGeral,
    cadastrarPontuacao
}