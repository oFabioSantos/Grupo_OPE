/*create database teste2;**/
use teste2;



create table usuarios(
                      ID smallint not null auto_increment,
                      Login varchar(10) not null,
					  Senha varchar(40) not null,                      
                      primary key(ID)
);

create table vendedores(
                        ID_vendedor smallint not null auto_increment,
                        Email varchar(50),
                        Nome varchar(60) not null,
                        Telefone varchar(11) not null, 
                        ID smallint not null,
                        primary key(ID_vendedores),
                        foreign key(ID) references usuarios(ID)
);

create table clientes(
                     ID_cliente smallint not null auto_increment,
                     Cpf varchar(18) not null,
                     Nome varchar(40) not null,
                     Telefone varchar(11) not null,
                     Email varchar(60) not null,
                     Endereco varchar(60) not null,
                     ID_vendedor smallint,
                     primary key(ID_cliente),
                     foreign key(ID_vendedor) references vendedores(ID_vendedor)

);

create table nutricionista(
                          ID_nutricionista smallint not null auto_increment,
                          Email varchar(50),
                          Nome varchar(60) not null,
                          Telefone varchar(11) not null,
                          CRN smallint not null,
                          ID smallint not null,
                          primary key(ID_nutricionista),
                          foreign key(ID) references usuarios(ID)
);

create table Agenda_nutricionista(
                                 ID_agenda smallint not null auto_increment,
                                 Agenda datetime,
                                 Descricao varchar(300),
                                 ID_nutricionista smallint,
                                 ID_vendedores smallint,
                                 primary key(ID_agenda),
                                 foreign key(ID_nutricionista) references Agenda_nutricionista(ID_nutricionista),
                                 foreign key(ID_vendedores) references Vendedores(ID_vendedor)                         
);

create table Consulta_nutricionista(
                                   ID_consulta smallint not null auto_increment,
                                   data_consulta datetime,
                                   Diagnostico varchar(1000),
                                   ID_nutricionista smallint not null,
                                   primary key(ID_consulta),
                                   foreign key(ID_nutricionista) references nutricionista(ID_nutricionista)



);

create table gerente(
                     ID_gerente smallint not null auto_increment,
                     Email varchar(50),
                     Nome varchar(60) not null,
                     Telefone varchar(11) not null,
                     ID smallint not null,
                     primary key(ID_gerente),
                     foreign key(ID) references usuarios(ID)

);

create table fornecedores(
                          ID_fornecedor smallint not null auto_increment,
                          CNPJ varchar(14) not null,
                          Razao_social varchar(100) not null,
                          Email varchar(60) not null,
                          Endereco varchar(60) not null,
                          Telefone varchar(20) not null,
                          ID_gerente smallint,
                          primary key(ID_fornecedor),
                          foreign key(ID_gerente) references gerente(ID_gerente)

);

create table portifolio_de_produtos(
								   ID_portifolio smallint not null auto_increment,
                                   Categoria varchar(30)not null,
                                   Codigo int not null,
                                   Marca varchar(30),
                                   Nome varchar(30),
                                   Descricao varchar(300),
                                   ID_gerente smallint,
                                   ID_vendedor smallint,
                                   primary key(ID_portifolio),
                                   foreign key(ID_gerente) references gerente(ID_gerente),
                                   foreign key(ID_vendedor) references vendedores(ID_vendedor)                                 

);

create table produtos(
					 ID_produto smallint not null auto_increment,
                     Categoria varchar(30)not null,
                     Codigo int not null,
                     Marca varchar(30),
                     Nome varchar(30),
                     Descricao varchar(300),                     
                     validade date not null,
                     lote int not null,
                     valor decimal(4,2),
                     ID_vendedor smallint,
                     primary key(ID_produto),
                     foreign key(ID_vendedor) references vendedores(ID_vendedor)

);

create table pedido(
                   ID_pedido smallint not null,
                   valor decimal(10,2) not null,
                   Data_pedido datetime not null,
                   ID_produto smallint,
                   ID_cliente smallint,
                   ID_vendedor smallint,
                   primary key (ID_pedido),
                   foreign key(ID_produto) references produtos(ID_produto),
                   foreign key(ID_cliente) references clientes(ID_cliente),
                   foreign key(ID_vendedor) references vendedores(ID_vendedor)
 
);
