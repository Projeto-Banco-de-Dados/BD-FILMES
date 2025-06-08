import pandas as pd
import pyodbc

# Conexão com o SQL Server (substitua pelos seus valores)
conn = pyodbc.connect(
    "Driver={SQL Server};"
    "Server=NITROEDU\SQLEXPRESS;" 
    "Database=IMDB;"
    "Trusted_Connection=yes;"
)
cursor = conn.cursor()

# Carrega o CSV 
df = pd.read_csv("imdb_top_1000.csv")

# Dicionários para mapeamento
diretores = {}
generos = {} 
atores = {}

def inserir_diretor(nome):
    if pd.isna(nome):
        return None
    if nome not in diretores:
        cursor.execute("INSERT INTO Diretor (nome) OUTPUT INSERTED.id VALUES (?)", nome)
        diretores[nome] = cursor.fetchone()[0]
    return diretores[nome]

def inserir_ator(nome):
    if pd.isna(nome):
        return None
    if nome not in atores:
        cursor.execute("INSERT INTO Ator (nome) OUTPUT INSERTED.id VALUES (?)", nome)
        atores[nome] = cursor.fetchone()[0]
    return atores[nome]

def inserir_genero(nome):
    if pd.isna(nome):
        return None
    nome = nome.strip()
    if nome not in generos:
        cursor.execute("INSERT INTO Genero (nome) OUTPUT INSERTED.id VALUES (?)", nome)
        generos[nome] = cursor.fetchone()[0]
    return generos[nome]

for _, row in df.iterrows():
    try:
        diretor_id = inserir_diretor(row['Director'])
        
        cursor.execute("""
            INSERT INTO Titulo (titulo, ano, classificacao_indicativa, duracao, sinopse,
            avaliacao_imdb, nota_critica, votos, receita, poster_link, diretor_id)
            OUTPUT INSERTED.id
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (
            row['Series_Title'], 
            int(row['Released_Year']) if pd.notnull(row['Released_Year']) else None,
            row['Certificate'], 
            row['Runtime'], 
            row['Overview'],
            float(row['IMDB_Rating']) if pd.notnull(row['IMDB_Rating']) else None,
            float(row['Meta_score']) if pd.notnull(row['Meta_score']) else None,
            int(row['No_of_Votes']) if pd.notnull(row['No_of_Votes']) else None,
            int(str(row['Gross']).replace(',', '')) if pd.notnull(row['Gross']) else None,
            row['Poster_Link'],
            diretor_id
        ))
        titulo_id = cursor.fetchone()[0]

        # Insere atores
        for col in ['Star1', 'Star2', 'Star3', 'Star4']:
            if pd.notnull(row[col]):
                ator_id = inserir_ator(row[col])
                cursor.execute("INSERT INTO Titulo_Ator (titulo_id, ator_id) VALUES (?, ?)", titulo_id, ator_id)

        # Insere gêneros
        if pd.notnull(row['Genre']):
            for genero_nome in row['Genre'].split(','):
                genero_id = inserir_genero(genero_nome.strip())
                cursor.execute("INSERT INTO Titulo_Genero (titulo_id, genero_id) VALUES (?, ?)", titulo_id, genero_id)

        conn.commit()
    except Exception as e:
        print(f"Erro ao inserir filme {row['Series_Title']}: {str(e)}")
        conn.rollback()

cursor.close()
conn.close()
print("Inserção concluída com sucesso!")