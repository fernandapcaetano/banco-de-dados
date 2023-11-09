Create Database Imobiliario
go
use Imobiliario
go
--Criar tabelas
Create Table Imovel(
cd_Imovel Int not null,
cd_Vendedor int,
cd_Bairro int,
cd_Cidade int,
sg_Estado char(02),
ds_Endereco Varchar(40),
qt_AreaUtil Decimal(10,2),
qtAreaTotal Decimal(10,2),
ds_Imovel Varchar(300),
vl_Imovel Money,
qt_Ofertas Int,
ic_Vendido Char(1),
dt_Lancto Datetime,
qt_ImovelIndicado int
)
go
Create Table Estado(
sg_Estado Char(02) not null,
nm_Estado Varchar(40)
)
go
Create Table Cidade(
cd_Cidade int not null,
sg_Estado char(02) not null,
nm_Cidade Varchar(40)
)
go
Create Table Bairro(
cd_Bairro int not null,
cd_Cidade int not null,
sg_Estado Char(02) not null,
nm_Bairro Varchar(40)
)
go
Create Table Faixa_Imovel(
cd_Faixa int not null,
nm_Faixa Varchar(20),
vl_Maximo money,
vl_Minimo money
)
go
Create Table Oferta(
cd_Comprador int not null,
cd_Imovel int not null,
vl_Oferta money,
dt_Oferta datetime
)
go
Create Table Comprador(
cd_Comprador int not null,
nm_Comprador varchar(40),
ds_Endereco varchar(40),
cd_CPF varchar(20),
nm_Cidade varchar(40),
nm_Bairro varchar(40),
sg_Estado char(02),
cd_Telefone varchar(20),
ds_Email varchar(60)
)
go
Create Table Vendedor(
cd_Vendedor int not null,
nm_Vendedor varchar(40),
ds_Endereco varchar(40),
cd_CPF varchar(15),
nm_Cidade varchar(40),
nm_Bairro varchar(40),
sg_Estado char(02),
cd_Telefone varchar(02),
ds_Email varchar(60)
)
go
/*================ CRIAR CHAVES PRIMARIAS =================*/
Alter Table Imovel
Add Primary Key(cd_Imovel)
go
Alter Table Bairro
Add Primary Key(cd_Bairro,cd_Cidade,sg_Estado)
go
Alter Table Cidade 
Add Primary Key(cd_Cidade,sg_Estado)
go
Alter Table Estado
Add Primary Key(sg_Estado)
go
Alter Table Faixa_Imovel
Add Primary Key(cd_Faixa)
go
Alter Table Oferta
Add Primary Key(cd_Comprador,cd_Imovel)
go
Alter Table Comprador
Add Primary Key(cd_Comprador)
go
Alter Table Vendedor
Add Primary Key(cd_Vendedor)
go
/*================ CRIAR CHAVE ESTRANGEIRA =================*/
Alter Table Cidade
Add Foreign Key(sg_Estado)
References Estado
go
Alter Table Bairro
Add Foreign Key(cd_Cidade, sg_Estado)
References Cidade
go
Alter Table Oferta
Add Foreign Key(cd_Comprador)
References Comprador
go
Alter Table Oferta
Add Foreign Key(cd_Imovel)
References Imovel
go
Alter Table Imovel
Add Foreign Key (cd_Bairro, cd_Cidade, sg_Estado)
References Bairro
go
Alter Table Imovel
Add Foreign Key(cd_Vendedor)
References Vendedor
go

/***================== EXERCICIO 1 ========================***/

Alter Table Oferta
Alter Column vl_Oferta money not null
go 
Alter Table Comprador 
Alter Column nm_Comprador varchar(20) not null

/***================== EXERCICIO 2 ========================***/

-- Apaga a chave estrangeira da tabela Oferta
Alter table Oferta
drop Constraint [FK__Oferta__cd_Imove__34C8D9D1]
go
-- Apaga a chave primaria da tabela Imóvel
Alter Table Imovel
Drop Constraint [PK__Imovel__54ED318D4AAAEC09]
go
-- Cria a chave primaria da tabela Imovel com nome de restrição
Alter Table Imovel
ADD Constraint PK_Imovel Primary Key (cd_Imovel)
go
-- Cria a chave estrangeira da tabela Oferta com referencia ao Imovel
Alter Table Oferta
ADD Constraint FK_Imovel Foreign Key (cd_Imovel)
References Imovel

/**-----------3. Adicionar uma coluna qt_Parcelas do tipo número inteiro na tabela Oferta, 
já criada e essa coluna deve aceitar números maiores que 1, usando o 
nome CK_qtParcela para a restrição.------**/

Alter Table Oferta
ADD qt_Parcelas int

Alter Table Oferta
ADD CONSTRAINT CK_qtParcelas CHECK (qt_Parcelas > 1);


/**---- 4. Renomear a coluna qt_Parcelas para qt_Parcelamento----**/

Alter Table Oferta
drop Constraint CK_qtParcelas;

Exec sp_rename 'Oferta.qt_Parcelas', 'qt_Parcelamento'


5. Renomear a tabela Faixa_Imovel para Faixa_Valor

Exec sp_rename 'Faixa_Imovel', 'Faixa_Valor'