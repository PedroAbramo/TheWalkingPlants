function buscarGeral(){

    fetch(`partidas/geral`)
    .then(response => {
      if (response.ok) {
        response.json().then(resposta => {
            console.log(resposta)
        });
      } else {
        console.error('Nenhuma pontuacao encontrada ou erro na API');
      }
    })
    .catch(error => {
      console.error(`Erro na obtenção das pontuacoes para exibir: ${error.message}`);
    });
}

function buscarGeral(){
    let dificuldade = ''//coloca a dificuldade aqui

    fetch(`partidas/geral?dificuldade=${dificuldade}`)
    .then(response => {
      if (response.ok) {
        response.json().then(resposta => {
            console.log(resposta)
        });
      } else {
        console.error('Nenhuma pontuacao encontrada ou erro na API');
      }
    })
    .catch(error => {
      console.error(`Erro na obtenção das pontuacoes para exibir: ${error.message}`);
    });
}

function cadastrar(){
    fetch("/partidas/cadastrar", {
      method: "POST",
      body: {
        nome: 'nomeAqui',
        pontuacao: 'pontucaoAqui',
        dificuldade: 'dificuldadeAqui'
      }
    })
      .then(function (resposta) {
        console.log("resposta: ", resposta);

        if (resposta.ok) {
          alert(
            "Cadastro da pontuacao realizado com sucesso!");
        } else {
          throw "Houve um erro ao tentar realizar o cadastro da pontuacao!";
        }
      })
      .catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
      });

    return false;

    
}