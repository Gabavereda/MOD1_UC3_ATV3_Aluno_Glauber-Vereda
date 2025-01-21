USE  hospital_db_atv3;

INSERT INTO medicos
(nome,datadenascimento,cpf,crm,uf_crm,telefoneMedico,endereco)
VALUES
('gabrielly cristina','1998-05-31','106.637.331-03',123456,'sp','2222-2222','travessa pedro alcantra'),
('claudio pereira','1987-03-20','033.952.030-26',245678,'sp','3333-3333','alameda dos santos n10'),
('jose bonifacio','1988-07-07','080.538.600-95',456789,'mg','4444-4444','rua monteiro lobato n256'),
('pedro tiago alencar','1992-05-15','763.681.560-58',567891,'mg','5555-5555','avenida portugal n315'),
('jose francisco','1995-10-10','555.195.650-40',678912,'sp','6666-6666','travessa livio dos santos n20'),
('alex ramiro','1981-02-20','537.109.210-23',789123,'al','7777-7777','rua fernando pessoa n45'),
('fernado da silva','1995-01-19','791.549.670-07',891234,'sp','8888-8888','avenida francisco morato n490'),
('sabrina vereda','1985-05-26','438.603.050-69',912345,'sp','9999-9999','avenida paulista n3598 apt15'),
('claudia dos santos','1991-03-22','997.548.160-42',987654,'sp','1212-1212','rua sereno n28'),
('sandra araujo','1979-08-06','705.797.630-56',876543,'rs','1313-1313','rua luis de camoes n263');

INSERT INTO especialidades (descricao_especialidade)
VALUES
('pediatria'),('clinica geral'),('gastroenterologia'),('demartologia'),('cardiologia'),('ortopedia'),('psicologia');


INSERT INTO medico_especialidades (id_especialidades,id_medicos)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(7,1),(6,2),(4,3);

INSERT INTO convenios (nomeDoConvenio,cnpj,tempoCarencia,numConvenio)
VALUES ('saude em dia','67.908.093/0001-28','90 dias',1),('bem-estar','74.711.100/0001-62','120 dias',2),
('intermedica','91.511.974/0001-95','45 dias',3),('saude total','00.426.750/0001-20','75 dias',4);

INSERT INTO pacientes (nome,datanasc,endereco,telefone,email,cpf,rg,id_convenios)
VALUES
('sandro mendes','1992-05-21','rua jose bonifacil n20','3535-3535','sandro@gmail.com','384.942.860-56','15.745.999-8',1),
('Lavínia Gabriela Farias','1993-07-11','rua lirio do vale n15','4545-4545','lavinia@hotmail.com','744.583.248-37','21.347.376-8',2),
('henry Gabriel Alves','1993-06-06','rua marques n10','5656-5656','henry@gmail.com','302.483.828-70','20.953.593-3',3),
('cauã lucca','1993-06-18','praça da aldeia s/n','3709-0579','caua@gmail.com','176.997.068-11','19.070.339-8',4),
('samuel breno','1992-07-23','rua flores n15','3820-5173','samuel@hotmail.com','418.427.028-07','30.206.323-7',1),
('alexandre da cruz','1990-05-04','rua orestes n444','3597-6061','alex@gmail.com','301.689.398-35','45.243.685-01',2),
('jorge moreira','1989-05-21','rua fernandopolis n23','3887-6808','jo@gmail.com','545.034.088-52','34.568.632-9',3),
('eduardo da silva','1993-01-24','rua santos','3174-2259','dudu@gmail.com','487.639.698-15','37.188.615-6',3),
('gustavo lucas da luz','1995-06-21','rua daniel bruhnan n50','3967-2477','gustavo@hortmail.com','057.500.348-01','28.806.272-3',4),
('luzia drummond','1997-05-19','rua joa sinezio s/n','3761-1996','luzia@gmail.com','243.188.738-38','21.436.459-8',1);


INSERT INTO consultas (dataHora,valorConsulta,id_convenios,id_especialidades,id_medicos,id_pacientes)
VALUES
('2017-01-10 08:15:00',150.00,1,1,1,1),('2017-01-15 10:15:00',200.00,2,2,2,2),('2017-02-25 10:00:00',250.00,3,3,3,3),
('2017-09-22 13:00:00',70.00,4,4,4,4),
('2017-06-11 12:00:00',190.00,2,5,3,2),('2018-01-23 09:00:00',190.00,3,5,3,3),('2018-05-23 15:00:00',110.00,4,7,4,4),
('2017-09-18 09:00:00',130.00,2,6,6,5),('2020-02-15 13:30:00',150.00,1,1,2,6),('2021-01-09 08:00:00',200.00,3,2,7,7);

INSERT INTO receitas (medicamentos_qnt_instrucoes,id_consultas)
VALUES ('Vastarel MR 35mg, 2 a 3 comprimidos diários, fracionada em 2 a 3 tomadas, às principais refeições.Vaslip 20mg Zurita,20 mg ou 40 mg por dia',2), 	
(' DIPIRONA MONIDRATADA,meio a 1 comprimido, administrado até 4 vezes por da.Dorflex com 10 comprimidos,1 a 2 comprimidos, 3 a 4 vezes ao dia',1),
('Lorazepam 2mg 20 comprimidos,uma única dose diária de 1 a 2 mg pode ser administrada, geralmente ao deitar.Alprazolam  0,5 mg,3 vezes por dia',3),
('Zoloft 50mg 30 Comprimidos Revestidos C1, Via oral em dose única diária pela manhã ou à noite, com ou sem alimentos, preferencialmente no mesmo horário.Torante,2,0 mL, três vezes ao dia, de 8 em 8 horas',4),
('budesonida,utilizar até 256 mcg/dia (2 aplicações de 64 mcg em cada narina ou 4 aplicações de 32 mcg em cada narina.Decongex Plus com 4 Comprimidos,1 comprimido pela manhã e 1 comprimido à noite. Dosagem máxima diária limitada a 2 comprimidos )',10);

INSERT INTO tipo_quarto (descricaoquarto,valor_diaria)
VALUES ('apartamentos-Ideal para internações a longa data onde o paciente ficara mais comodo durante a estadia',400.00),
('quartos duplos-Para internações onde se necessita um espaço para duas pessoas',200.00),
('enfermaria-procedimentos de curta duração onde a estadia não é tão longa',120.00);

INSERT INTO quartos (numero_quarto,tipo_quarto_id)
VALUES (1,1),(2,2),(3,3);

INSERT INTO internacao (data_entrada,data_prev_alta,data_alta,procedimento,
quarto_id,pacientes_id,medicos_id)
VALUES
('2017-02-20 09:00:00','2017-03-20','2017-03-20 14:00:00','cirugia do joelho',1,1,1),
('2017-06-15 12:00:00','2017-06-20','2017-06-22 18:00:00','fisioterapia',2,1,1),
('2017-12-01 07:30:00','2017-12-04','2017-12-04 09:00:00','aplicação de stent',3,6,4),
('2018-01-19 04:00:00','2018-01-23','2018-01-05 12:00:00','cirugia vasculhar',3,6,3),
('2018-05-07 05:00:00','2018-05-07','2018-05-07 10:00:00','tratamento de trauma de fratura',2,8,6),
('2020-01-01 09:00:00','2020-02-01','2020-02-01 16:00:00','remoção de tumor',1,4,8),
('2021-06-07 12:00:00','2021-06-09','2021-06-09 19:00:00','internação por infecção bacteriana',1,5,7);

INSERT INTO enfermeiro (nome,cpf,cre)
VALUES ('yago Miguel Juan Jesus','709.401.458-98','012.345 SP'),('erick Thiago Benedito','461.072.848-69','033.555 PR'),
('caio Martin Carlos Eduardo','902.348.038-43','055.022 SP'),('laís Gabrielly Rocha','928.146.108-05','222.158 sp'),
('elaine Joana Lopes','937.593.658-92','456.567 SP'),('Luzia Simone Pereira','386.777.108-17','478.777 RS');

INSERT INTO internacao_enfermeiro (internacao_id,enfermeiro_id)
VALUES (1,1),(1,2),(2,2),(2,3),(3,4),(3,5);
