DROP DATABASE db_livraria;
CREATE DATABASE db_livraria;

USE db_livraria;

-- Parte 1: Definição de Dados (DDL)
-- 1. Criação da Tabela autor:
CREATE TABLE IF NOT EXISTS autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	nacionalidade VARCHAR(50),
	data_nascimento DATE 
);
-- 2. Criação da Tabela editora:
CREATE TABLE IF NOT EXISTS editora (
	id_editora INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);
-- 3. Criação da Tabela livro (com Chaves Estrangeiras):
CREATE TABLE IF NOT EXISTS livro (
	ID_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
	ano_publicacao YEAR,
    id_editora INT,
    FOREIGN KEY (id_editora) REFERENCES editora (id_editora),
    id_autor_principal INT,
    FOREIGN KEY (id_autor_principal) REFERENCES autor (id_autor)
);
-- 4. Alteração de Estrutura (ALTER TABLE):
ALTER TABLE editora 
MODIFY COLUMN telefone VARCHAR(30);
ALTER TABLE editora 
ADD email VARCHAR(100);
-- 5. Comando de Exclusão Comercial (DROP TABLE):
-- 	DROP TABLE livro;

-- Parte 2: Manipulação de Dados (DML)
-- 6. Inserção Múltipla (INSERT INTO):

INSERT INTO autor (nome, nacionalidade, data_nascimento) VALUES ("Leonardo","México",'1980-08-19');
INSERT INTO autor (nome, nacionalidade, data_nascimento) VALUES ("Mario","Espanhol",'1999-02-21');
INSERT INTO autor (nome, nacionalidade, data_nascimento) VALUES ("Lucas","Brasil",'2002-07-05');

INSERT INTO editora (nome, endereco, telefone) VALUES ("Companhia das Letras","Portugal","719975-5963");
INSERT INTO editora (nome, endereco, telefone) VALUES ("Grupo Editorial Record","Brasil","719885-6734");

-- 7. Inserção com Relacionamento (INSERT INTO):

INSERT INTO livro (titulo, ano_publicacao,id_editora,id_autor_principal) VALUES ("O Livro dos Abraços", 2006,2,1);
INSERT INTO livro (titulo, ano_publicacao,id_editora,id_autor_principal) VALUES ("Um brasileiro no Mundo", 2006,1,3);

-- 8. Atualização de Dados (UPDATE):

UPDATE autor
SET nacionalidade = "Brasil"
WHERE id_autor = 1;

UPDATE editora
SET telefone = "24 9958-5223"
WHERE id_editora = 1;

-- 9. Remoção de Dados (DELETE):
-- Executar o comando DELETE sem o where acaba acarretando de apagar todos os dados da tabela e o UPDATE vai realizar a atualização de todos igualmente.
DELETE FROM livro
WHERE id_editora = 2;

-- Parte 3: Consulta de Dados (DQL)
-- 10. Consultas Simples (SELECT):

SELECT * FROM autor;
SELECT titulo, ano_publicacao FROM livro;
