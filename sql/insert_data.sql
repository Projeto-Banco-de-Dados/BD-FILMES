-- Tabela Diretor
INSERT INTO Diretor (nome) VALUES
('Christopher Nolan'),
('Steven Spielberg'),
('Quentin Tarantino'),
('Martin Scorsese'),
('James Cameron'),
('Greta Gerwig'),
('Alfred Hitchcock'),
('Stanley Kubrick'),
('Ridley Scott'),
('Tim Burton');

-- Tabela Ator
INSERT INTO Ator (nome) VALUES
('Leonardo DiCaprio'),
('Meryl Streep'),
('Tom Hanks'),
('Viola Davis'),
('Denzel Washington'),
('Cate Blanchett'),
('Robert De Niro'),
('Marlon Brando'),
('Ingrid Bergman'),
('Humphrey Bogart');

-- Tabela Genero
INSERT INTO Genero (nome) VALUES
('Sci-Fi'),
('Action'),
('Drama'),
('Crime'),
('Romance'),
('Adventure'),
('Comedy'),
('Fantasy'),
('Horror'),
('Mystery'),
('Thriller');

-- Tabela Titulo
INSERT INTO Titulo (titulo, ano, classificacao_indicativa, duracao, sinopse, avaliacao_imdb, nota_critica, votos, receita, poster_link, diretor_id) VALUES
('Inception', 2010, 'PG-13', '148 min', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 8.8, 74, 2000000, 836800000, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_UX67_CR0,0,67,98_AL_.jpg', 1),
('The Shawshank Redemption', 1994, 'R', '142 min', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 9.3, 80, 2300000, 58300000, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX67_CR0,0,67,98_AL_.jpg', NULL),
('Pulp Fiction', 1994, 'R', '154 min', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 8.9, 94, 1800000, 213900000, 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY98_CR0,0,67,98_AL_.jpg', 3),
('The Dark Knight', 2008, 'PG-13', '152 min', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 9.0, 84, 2300000, 1004900000, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX67_CR0,0,67,98_AL_.jpg', 1),
('Titanic', 1997, 'PG-13', '194 min', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 7.8, 75, 1100000, 2187500000, 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UX67_CR0,0,67,98_AL_.jpg', 5),
('Barbie', 2023, 'PG-13', '114 min', 'Barbie suffers a crisis that leads her to question her world and her existence.', 6.9, 80, 350000, 1445600000, 'https://m.media-amazon.com/images/M/MV5BNjU3N2QxNzYtMjk1NC00MTc4LTk1NTQtMmUxNTljM2I0NDA5XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_UX67_CR0,0,67,98_AL_.jpg', 6),
('Psycho', 1960, 'R', '109 min', 'A Phoenix secretary embezzles $40,000 from her employer''s client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.', 8.5, 97, 600000, 50000000, 'https://m.media-amazon.com/images/M/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX67_CR0,0,67,98_AL_.jpg', 7),
('2001: A Space Odyssey', 1968, 'G', '149 min', 'After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000.', 8.3, 84, 600000, 146000000, 'https://m.media-amazon.com/images/M/MV5BMmNlYzRiNDctZWNhMi00MzI4LThkZTctMTUzMmZkMmFmNThmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX67_CR0,0,67,98_AL_.jpg', 8),
('Alien', 1979, 'R', '117 min', 'The crew of a commercial spacecraft encounter a deadly lifeform after investigating an unknown transmission.', 8.4, 89, 800000, 106300000, 'https://m.media-amazon.com/images/M/MV5BOGQzZTBjMjQtOTVmMS00NGE5LWEyYmMtOGQ1ZGZjNmRkYjFhXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX67_CR0,0,67,98_AL_.jpg', 9),
('Edward Scissorhands', 1990, 'PG-13', '105 min', 'An artificial man, who was incompletely constructed and has scissors for hands, leads a solitary life. Then one day, a suburban lady meets him and introduces him to her world.', 7.9, 74, 450000, 86000000, 'https://m.media-amazon.com/images/M/MV5BNDUxNTAyZmEtZjMxNi00NmNjLWFmNWItMmU5MDZkNTFhMDcyXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_UX67_CR0,0,67,98_AL_.jpg', 10);

-- Tabela Titulo_Ator
INSERT INTO Titulo_Ator (titulo_id, ator_id) VALUES
(1, 1), (1, 3),  -- Inception
(2, 3), (2, 7),  -- Shawshank Redemption
(3, 1), (3, 7),  -- Pulp Fiction
(4, 1), (4, 5),  -- Dark Knight
(5, 2), (5, 6),  -- Titanic
(6, 2), (6, 4),  -- Barbie
(7, 8), (7, 9),  -- Psycho
(8, 3), (8, 10), -- 2001
(9, 5), (9, 6),  -- Alien
(10, 1), (10, 2); -- Edward Scissorhands

-- Tabela Titulo_Genero
INSERT INTO Titulo_Genero (titulo_id, genero_id) VALUES
(1, 1), (1, 2),   -- Inception: Sci-Fi, Action
(2, 3),           -- Shawshank: Drama
(3, 4), (3, 3),   -- Pulp Fiction: Crime, Drama
(4, 2), (4, 4), (4, 3), -- Dark Knight: Action, Crime, Drama
(5, 3), (5, 5),   -- Titanic: Drama, Romance
(6, 6), (6, 7), (6, 8), -- Barbie: Adventure, Comedy, Fantasy
(7, 9), (7, 10), (7, 11), -- Psycho: Horror, Mystery, Thriller
(8, 6), (8, 1),   -- 2001: Adventure, Sci-Fi
(9, 9), (9, 1),   -- Alien: Horror, Sci-Fi
(10, 3), (10, 8), (10, 5); -- Edward: Drama, Fantasy, Romance