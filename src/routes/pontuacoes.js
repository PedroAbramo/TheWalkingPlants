var express = require("express");
var router = express.Router();

var pontuacaoController = require("../controllers/pontuacaoController");
router.post("/cadastrar", function (req, res) {
    pontuacaoController.cadastrarPontuacao(req, res);
})

router.get("/geral", function (req, res) {
    pontuacaoController.buscarGeral(req, res);
});

router.get("/especifico", function (req, res) {
    pontuacaoController.buscarEspecifico(req, res);
});
module.exports = router;