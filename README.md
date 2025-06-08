# Projeto de Banco de Dados: IMDB Top 1000 (Terminal Interativo)

**Disciplina**: Banco de Dados  
**Professor**: Vinicius von Glehn De Filippo  
**Equipe**: Eduardo Amaral, Pedro Ramalho, Moreno Jones e Lucas Telles

**Data de Entrega**: 08/06/2024  

---

## 📌 Descrição do Projeto
Aplicação em terminal Python que interage com um banco de dados relacional (Microsoft SQL Server) baseado no dataset **IMDB Top 1000 Movies and TV Shows**. O sistema permite:
- Consulta e filtragem de filmes por diretor, ator, avaliação e gênero.
- Operações CRUD (opcional, se implementado).
- Geração de relatórios (ex: filmes com melhor avaliação).

**Diferencial**: Interface intuitiva em terminal, modelagem relacional personalizada e integração direta com SQL Server.

---

## 🛠️ Tecnologias e Requisitos
- **SGBD**: Microsoft SQL Server (obrigatório)
- **Linguagem**: Python 3.8+
- **Bibliotecas**: `pandas`, `pyodbc`
- **Base de Dados**: [IMDB Dataset of Top 1000 Movies and TV Shows](https://www.kaggle.com/datasets/harshitshankhdhar/imdb-dataset-of-top-1000-movies-and-tv-shows) (300+ registros)
- **Plataforma**: Local (terminal) ou Web (se adaptado).

---

## 📋 Entregáveis
1. **DER (Diagrama Entidade-Relacionamento)**  
   ![DER](sql/DER_IMDB.png) *(adicione a imagem do diagrama na pasta `sql/`)*
2. **Scripts SQL**:
   - `create_tables.sql`: Criação das tabelas (`Filmes`, `Diretores`, `Atores`, `Filme_Ator`).
   - `insert_data.sql`: Inserção dos dados do dataset.
3. **Vídeo de Apresentação**: [Link do YouTube](https://youtu.be/seulink) (5 minutos máx.).
4. **Repositório GitHub**:
   - Código-fonte (`python/`).
   - Scripts SQL (`sql/`).
   - Documentação (este README).

---

## 🚀 Instalação e Execução

### Pré-requisitos
- Instância do **Microsoft SQL Server** ativa.
- Banco de dados criado (ex: `IMDB`).

### Passo a Passo
1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/imdb-terminal-project.git
   cd imdb-terminal-project
   
