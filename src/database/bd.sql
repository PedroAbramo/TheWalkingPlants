create database TheWalkingPlants;

create table TheWalkingPlants.Dificuldade(
	idDificuldade int auto_increment,
    descricao varchar(7),
    primary key (idDificuldade)
);
create table TheWalkingPlants.Partida(
	idPartida int auto_increment,
    nomeUsuario varchar(70),
    pontuacao int,
    fkDificuldade int,
    primary key (idPartida),
    foreign key (fkDificuldade) references TheWalkingPlants.Dificuldade (idDificuldade)
);

insert into TheWalkingPlants.Dificuldade (descricao) values
('Fácil'),
('Médio'),
('Difícil');

insert into TheWalkingPlants.Partida (nomeUsuario, pontuacao, fkDificuldade) values
('JoaoSilva', 250, 1), 
('MariaOliveira', 310, 2), 
('CarlosAlmeida', 500, 3),
('AnaCosta', 320, 1),
('FelipeSantos', 400, 2),
('JulianaPereira', 450, 3),
('LucasMendes', 270, 1),
('PaulaRocha', 390, 2),
('RicardoMartins', 470, 3),
('FernandaDias', 330, 1),
('TiagoRibeiro', 350, 2),
('MarceloLima', 480, 3),
('RaquelCardoso', 310, 1),
('VictorGomes', 390, 2),
('IsabelaFerreira', 520, 3),
('EduardoAraujo', 250, 1),
('PatriciaNunes', 420, 2),
('BrunoSilva', 460, 3),
('RobertaCosta', 330, 1),
('GabrielOliveira', 370, 2),
('CarlaMelo', 490, 3),
('RicardoTeixeira', 320, 1),
('MarianaSantos', 410, 2),
('DanielRodrigues', 530, 3),
('LarissaAlves', 300, 1),
('JorgeCarvalho', 340, 2),
('CintiaSoares', 460, 3),
('LeandroCampos', 310, 1),
('SofiaVasconcelos', 380, 2);


-- Listar a maior pontuação geral
select p.nomeUsuario, case d.descricao 
	when 'Fácil' then p.pontuacao*1
	when 'Médio' then p.pontuacao*2
    else p.pontuacao*3
end pontuacao from TheWalkingPlants.Partida p
inner join TheWalkingPlants.Dificuldade d on p.fkDificuldade=d.idDificuldade
order by pontuacao desc;


-- Listar apenas da dificuldade fácil
select p.nomeUsuario, case d.descricao 
	when 'Fácil' then p.pontuacao*1
	when 'Médio' then p.pontuacao*2
    else p.pontuacao*3
end pontuacao from TheWalkingPlants.Partida p
inner join TheWalkingPlants.Dificuldade d on p.fkDificuldade=d.idDificuldade
where d.descricao='Fácil'
order by pontuacao desc;

-- Listar apenas da dificuldade médio
select p.nomeUsuario, case d.descricao 
	when 'Fácil' then p.pontuacao*1
	when 'Médio' then p.pontuacao*2
    else p.pontuacao*3
end pontuacao from TheWalkingPlants.Partida p
inner join TheWalkingPlants.Dificuldade d on p.fkDificuldade=d.idDificuldade
where d.descricao='Médio'
order by pontuacao desc;

-- Listar apenas da dificuldade difícil
select p.nomeUsuario, case d.descricao 
	when 'Fácil' then p.pontuacao*1
	when 'Médio' then p.pontuacao*2
    else p.pontuacao*3
end pontuacao from TheWalkingPlants.Partida p
inner join TheWalkingPlants.Dificuldade d on p.fkDificuldade=d.idDificuldade
where d.descricao='Difícil'
order by pontuacao desc;

