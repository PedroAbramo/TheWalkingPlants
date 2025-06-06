var database = require("../database/config")

function buscarGeral() {
    console.log("ACESSEI O pontuacao MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarGeral(): ")
    var instrucaoSql = `
        select p.nomeUsuario, case d.descricao 
	when 'Fácil' then p.pontuacao*1
	when 'Médio' then p.pontuacao*2
    else p.pontuacao*3
    end pontuacao from Partida p
    inner join Dificuldade d on p.fkDificuldade=d.idDificuldade
    order by pontuacao desc;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarEspecifico(dificuldade) {
    console.log("ACESSEI O pontuacao MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function buscarGeral(): ")
    var instrucaoSql = `
        select p.nomeUsuario, case d.descricao 
	when 'Fácil' then p.pontuacao*1
	when 'Médio' then p.pontuacao*2
    else p.pontuacao*3
    end pontuacao from Partida p
    inner join Dificuldade d on p.fkDificuldade=d.idDificuldade
    where d.descricao='${dificuldade}'
    order by pontuacao desc;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrarPontuacao(nome, pontuacao, dificuldade) {
    console.log("ACESSEI O pontuacao MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarPontuacao():");
     var instrucaoSql = `
        insert into TheWalkingPlants.Partida (nomeUsuario, pontuacao, fkDificuldade) values (${nome},${pontuacao},${dificuldade})
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
}
module.exports = {
    buscarGeral,
    buscarEspecifico,
    cadastrarPontuacao
};