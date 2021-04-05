CREATE DATABASE Agenda;

use Agenda;
create table Agendamento 
(id int auto_increment,
Cliente varchar(255),
CPF char(11),
Telefone varchar(11),
primary key(id)
);

DROP TABLE Produto;
DROP TABLE Pacote;
DROP TABLE Agendamento;

create table Produto
(id int auto_increment, 
Marca VARCHAR(20),
Descrição VARCHAR(80),
Preço DECIMAL(6,2),
Categoria VARCHAR(80),
Quantidade INTEGER,
primary key (id)
);

CREATE TABLE Pacote 
(ID INT auto_increment,
Descricao VARCHAR(255),
Valor DECIMAL(6,2),
id_produto INT,
PRIMARY KEY (ID),
FOREIGN KEY (id_produto) REFERENCES Produto(id)
);

CREATE TABLE Servico 
(ID INT auto_increment,
Descricao VARCHAR(255),
Valor DECIMAL(6,2),
PRIMARY KEY (ID)
);

CREATE TABLE Agendamento
(ID INT auto_increment,
Cliente VARCHAR(50),
Telefone VARCHAR(11),
Data_ DATE,
Hora TIME,
id_produto INT,
id_servico INT,
PRIMARY KEY(ID),
FOREIGN KEY (id_produto) REFERENCES Produto(ID),
FOREIGN KEY (id_servico) REFERENCES Servico(ID)
);

CREATE TABLE Venda
(ID INT auto_increment,
Valor_total DECIMAL(6,2),
id_pacote INT,
id_produto INT,
id_servico INT,
PRIMARY KEY(ID),
FOREIGN KEY (id_pacote) REFERENCES Pacote(ID),
FOREIGN KEY (id_produto) REFERENCES Produto(ID),
FOREIGN KEY (id_servico) REFERENCES Servico(ID)
);
