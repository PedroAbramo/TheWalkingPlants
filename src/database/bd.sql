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

