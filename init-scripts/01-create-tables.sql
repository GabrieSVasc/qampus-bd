CREATE TABLE IF NOT EXISTS Usuario (
  id INT PRIMARY KEY Not Null,
  email VARCHAR(100) Unique Not Null,
  nome VARCHAR(100) Not Null,
  senha VARCHAR(100) Not Null,
  reputacao INT Not Null
);

CREATE TABLE IF NOT EXISTS Professor(
  codigo VARCHAR(50) PRIMARY KEY Not Null,
  idUsuario INT Not Null,
  FOREIGN KEY (idUsuario) REFERENCES Usuario(id)
);

CREATE TABLE IF NOT EXISTS Curso(
  id INT PRIMARY KEY Not Null,
  bloco CHAR(1),
  nome VARCHAR(50),
  codCoordenador VARCHAR(50) Not Null,
  FOREIGN KEY (codCoordenador) REFERENCES Professor(codigo)
);

CREATE TABLE IF NOT EXISTS Aluno(
  matricula VARCHAR(50) PRIMARY KEY Not Null,
  idUsuario INT Not Null,
  idCurso INT Not Null,

  FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
  FOREIGN KEY (idCurso) REFERENCES Curso(id)
);

CREATE TABLE IF NOT EXISTS Post(
  id INT PRIMARY KEY Not Null,
  conteudo VARCHAR(5000) Not Null,
  data_postagem date Not Null,
  titulo VARCHAR(150) Not Null,
  idUsuario INT Not Null,
  FOREIGN KEY (idUsuario) REFERENCES Usuario(id)
);

CREATE TABLE IF NOT EXISTS Comentario(
  id INT PRIMARY KEY Not Null,
  conteudo VARCHAR(1000) Not Null,
  data_comentario date Not Null,
  idUsuario INT Not Null,
  idPost INT Not Null,

  FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
  FOREIGN KEY (idPost) REFERENCES Post(id)
);

CREATE TABLE IF NOT EXISTS Voto(
  id INT PRIMARY KEY Not Null,
  tipo INT Not Null,
  idUsuario INT Not Null,
  idPost INT Not Null,

  FOREIGN KEY (idUsuario) REFERENCES Usuario(id),
  FOREIGN KEY (idPost) REFERENCES Post(id)
);

CREATE TABLE IF NOT EXISTS Tag(
  id INT PRIMARY KEY Not Null,
  nome VARCHAR(50) Not Null
);

CREATE TABLE IF NOT EXISTS Tag_Post(
  idTag INT Not Null,
  idPost INT Not Null,
  PRIMARY KEY(idTag, idPost),
  FOREIGN KEY (idTag) REFERENCES Tag(id),
  FOREIGN KEY (idPost) REFERENCES Post(id)
);

CREATE TABLE IF NOT EXISTS Disciplina(
  codigo VARCHAR(50) PRIMARY KEY Not Null,
  nome VARCHAR(50) Not Null,
  idCurso INT Not Null,

  FOREIGN KEY (idCurso) REFERENCES Curso(id)
);

CREATE TABLE IF NOT EXISTS Turma(
  id INT PRIMARY KEY Not Null,
  periodo CHAR(6) Not Null,
  codDisciplina VARCHAR(50) Not Null,
  codProfessor VARCHAR(50) Not Null,

  FOREIGN KEY (codDisciplina) REFERENCES Disciplina(codigo),
  FOREIGN KEY (codProfessor) REFERENCES Professor(codigo)
);

CREATE TABLE IF NOT EXISTS Estuda(
  idTurma INT Not Null,
  matrAluno VARCHAR(50) Not Null,
  PRIMARY KEY(idTurma, matrAluno),
  FOREIGN KEY (idTurma) REFERENCES Turma(id),
  FOREIGN KEY (matrAluno) REFERENCES Aluno(matricula)
);