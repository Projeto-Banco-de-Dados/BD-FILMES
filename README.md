# Projeto de Banco de Dados IMDB Top 1000 (Terminal Interativo)

Este repositório contém um projeto de banco de dados simplificado baseado no dataset IMDB Top 1000 Filmes e Séries, com foco em um menu interativo em terminal para interação com o banco de dados.

## Descrição do Projeto

O projeto tem como objetivo principal demonstrar a criação e interação com um banco de dados relacional para armazenar informações sobre os 1000 melhores filmes e séries do IMDB. A interação com o banco de dados é feita através de um menu interativo em terminal, permitindo ao usuário realizar operações como listar filmes, diretores e atores, além de buscar informações específicas.

O banco de dados foi modelado para o Microsoft SQL Server e inclui tabelas para Filmes, Diretores, Atores e uma tabela de relacionamento para Filmes e Atores.

## Base de Dados

O projeto utiliza o dataset "IMDB Dataset of Top 1000 Movies and TV Shows" disponível no Kaggle:
[https://www.kaggle.com/datasets/harshitshankhdhar/imdb-dataset-of-top-1000-movies-and-tv-shows](https://www.kaggle.com/datasets/harshitshankhdhar/imdb-dataset-of-top-1000-movies-and-tv-shows)

## Requisitos

- Python 3.8+
- Microsoft SQL Server
- Bibliotecas Python: `pandas`, `pyodbc`

## Instruções para Instalação e Execução

1. **Clone este repositório:**

   ```bash
   git clone https://github.com/seu-usuario/imdb-terminal-project.git
   cd imdb-terminal-project
   ```

   _(Nota: Substitua `seu-usuario` pelo seu nome de usuário do GitHub e `imdb-terminal-project` pelo nome do seu repositório.)_

2. **Instale as dependências Python:**

   ```bash
   pip install pandas pyodbc
   ```

3. **Configure o Microsoft SQL Server:**

   - Certifique-se de ter uma instância do Microsoft SQL Server em execução.
   - Crie um banco de dados chamado `IMDB`.
   - Execute os scripts SQL localizados na pasta `sql/` na seguinte ordem:
     1. `create_tables.sql`: Cria as tabelas necessárias (`Diretores`, `Atores`, `Filmes`, `Filme_Ator`).
     2. `insert_data.sql`: Insere os dados do dataset IMDB nas tabelas criadas.

4. **Configure a conexão com o banco de dados no Python:**

   - Acesse os arquivos da pasta `python/`.
   - Localize a linha onde a variável `conn` é definida com `pyodbc.connect(...)`.
   - Atualize os parâmetros de conexão conforme a sua configuração do SQL Server:
     - `SERVER`: nome do servidor e instância (ex: `localhost\\SQLEXPRESS`)
     - `DATABASE`: nome do banco de dados (ex: `IMDB`)

5. **Execute a aplicação do menu interativo:**

   ```bash
   cd python
   python menu_interativo.py
   ```

   O menu interativo será exibido no terminal, permitindo que você explore os dados do IMDB.
