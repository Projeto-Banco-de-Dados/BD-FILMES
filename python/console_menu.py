import pyodbc

# Conexão com o SQL Server (substitua pelos seus valores)
conn = pyodbc.connect(
    "Driver={SQL Server};"
    "Server=NITROEDU\SQLEXPRESS;" 
    "Database=IMDB;"
    "Trusted_Connection=yes;"
)
cursor = conn.cursor()

def listar_filmes(limite=50):
    cursor.execute("""
        SELECT TOP (?) T.titulo, T.ano, D.nome AS diretor, T.avaliacao_imdb
        FROM Titulo T
        LEFT JOIN Diretor D ON T.diretor_id = D.id
        ORDER BY T.avaliacao_imdb DESC
    """, limite)
    print("\n=== TOP FILMES POR AVALIAÇÃO ===")
    for i, row in enumerate(cursor.fetchall(), 1):
        print(f"{i}. {row.titulo} ({row.ano}) | Diretor: {row.diretor or 'Desconhecido'} | IMDB: {row.avaliacao_imdb}")

def buscar_por_ator():
    nome = input("Digite o nome do ator: ").strip()
    if not nome:
        print("Por favor, digite um nome válido.")
        return
    
    cursor.execute("""
        SELECT T.titulo, T.ano, T.avaliacao_imdb
        FROM Titulo T
        JOIN Titulo_Ator TA ON T.id = TA.titulo_id
        JOIN Ator A ON TA.ator_id = A.id
        WHERE A.nome LIKE ?
        ORDER BY T.avaliacao_imdb DESC
    """, f"%{nome}%")
    
    resultados = cursor.fetchall()
    if resultados:
        print(f"\n=== FILMES COM O ATOR: {nome.upper()} ===")
        for i, row in enumerate(resultados, 1):
            print(f"{i}. {row.titulo} ({row.ano}) | Nota: {row.avaliacao_imdb}")
    else:
        print("Nenhum filme encontrado com esse ator.")

def buscar_por_genero():
    nome = input("Digite o nome do gênero: ").strip()
    if not nome:
        print("Por favor, digite um gênero válido.")
        return
    
    cursor.execute("""
        SELECT T.titulo, T.ano, T.avaliacao_imdb
        FROM Titulo T
        JOIN Titulo_Genero TG ON T.id = TG.titulo_id
        JOIN Genero G ON TG.genero_id = G.id
        WHERE G.nome LIKE ?
        ORDER BY T.avaliacao_imdb DESC
    """, f"%{nome}%")
    
    resultados = cursor.fetchall()
    if resultados:
        print(f"\n=== FILMES DO GÊNERO: {nome.upper()} ===")
        for i, row in enumerate(resultados, 1):
            print(f"{i}. {row.titulo} ({row.ano}) | Nota: {row.avaliacao_imdb}")
    else:
        print("Nenhum filme encontrado com esse gênero.")

def estatisticas_diretores():
    cursor.execute("""
        SELECT D.nome, AVG(T.avaliacao_imdb) as media, COUNT(T.id) as qtd_filmes
        FROM Diretor D
        LEFT JOIN Titulo T ON D.id = T.diretor_id
        GROUP BY D.nome
        HAVING COUNT(T.id) > 0
        ORDER BY media DESC
    """)
    print("\n=== DIRETORES COM MELHORES MÉDIAS ===")
    for i, row in enumerate(cursor.fetchall(), 1):
        print(f"{i}. {row.nome}: Média {row.media:.1f} | Filmes: {row.qtd_filmes}")

def top_atores():
    cursor.execute("""
        SELECT TOP 10 A.nome, COUNT(TA.titulo_id) as qtd_filmes
        FROM Ator A
        JOIN Titulo_Ator TA ON A.id = TA.ator_id
        GROUP BY A.nome
        ORDER BY qtd_filmes DESC
    """)
    print("\n=== TOP 10 ATORES MAIS FREQUENTES ===")
    for i, row in enumerate(cursor.fetchall(), 1):
        print(f"{i}. {row.nome}: {row.qtd_filmes} filmes")

def buscar_por_decada():
    try:
        decada = int(input("Digite a década (ex: 1990 para 1990-1999): "))
        cursor.execute("""
            SELECT titulo, ano, avaliacao_imdb
            FROM Titulo
            WHERE ano BETWEEN ? AND ?
            ORDER BY avaliacao_imdb DESC
        """, decada, decada + 9)
        resultados = cursor.fetchall()
        
        if resultados:
            print(f"\n=== MELHORES FILMES DA DÉCADA {decada}-{decada+9} ===")
            for i, row in enumerate(resultados, 1):
                print(f"{i}. {row.titulo} ({row.ano}) | Nota: {row.avaliacao_imdb}")
        else:
            print(f"Nenhum filme encontrado na década {decada}-{decada+9}.")
    except ValueError:
        print("Erro: Digite um ano válido.")

def menu():
    while True:
        print("\n=== SISTEMA DE CONSULTA DE FILMES ===")
        print("1 - Listar melhores filmes (por avaliação)")
        print("2 - Buscar filmes por ator")
        print("3 - Buscar filmes por gênero")
        print("4 - Estatísticas de diretores")
        print("5 - Top 10 atores mais frequentes")
        print("6 - Buscar filmes por década")
        print("0 - Sair")
        opcao = input("Escolha uma opção: ").strip()

        if opcao == "1":
            listar_filmes()
        elif opcao == "2":
            buscar_por_ator()
        elif opcao == "3":
            buscar_por_genero()
        elif opcao == "4":
            estatisticas_diretores()
        elif opcao == "5":
            top_atores()
        elif opcao == "6":
            buscar_por_decada()
        elif opcao == "0":
            break
        else:
            print("Opção inválida. Tente novamente.")

    cursor.close()
    conn.close()
    print("Sistema encerrado.")

if __name__ == "__main__":
    menu()