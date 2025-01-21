USE hospital_db_atv3;


#UPDATES NECESSARIOS
UPDATE consultas SET datahora = '2020-09-22 13:00:00' WHERE id = 4 or id=7;
UPDATE internacao SET data_entrada ='2017-12-01' WHERE id = 4;
UPDATE pacientes SET datanasc = '2006-05-21' WHERE id = 3 ;
UPDATE pacientes SET datanasc = '2008-05-21' WHERE id = 7 OR id=10;
UPDATE consultas SET datahora ='2019-01-10 08:15:00' WHERE id = 2;
UPDATE consultas SET datahora ='2018-01-10 08:15:00' WHERE id = 4;
UPDATE consultas SET datahora ='2020-01-25 08:00:00' WHERE id = 10;


#pesquisa pra valor medio das consultas do ano de 2020 sem convenio
SELECT c.datahora,c.valorconsulta,c.id_convenios,AVG(c.valorconsulta) AS media FROM consultas AS c
WHERE  c.id_convenios IS NULL
AND  datahora BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY c.id;

#pesquisa pra valor medio das consultas do ano de 2020 por convenio 
SELECT c.datahora,c.valorconsulta,c.id_convenios,AVG(c.valorconsulta)AS media FROM consultas AS c
WHERE   c.id_convenios IS NOT NULL   
AND  datahora BETWEEN '2020-01-01' AND '2020-12-31' 
GROUP BY c.id ;
    
#internações que tiveram data de alta maior que a data prevista para a alta
SELECT * FROM internacao WHERE  data_alta > Data_prev_alta;

#primeira consulta e receita		
SELECT * FROM consultas AS C 
JOIN receitas ON c.id = id_consultas
WHERE id_consultas = 1  ;

#consulta mais cara e mais barata sem convenio
SELECT * FROM consultas ,(SELECT MAX(valorConsulta) AS 'Maior_valor',
MIN(valorConsulta) AS 'Menorvalor' FROM consultas WHERE id_convenios IS NULL) AS C
WHERE id_convenios IS NULL; 

#dados de quanto cada quarto tem que pagar de acordo com valor da diaria
SELECT i.id AS internacao_id,i.data_entrada,i.data_alta,i.procedimento,
	   t.valor_diaria,
	   i.quarto_id,
    DATEDIFF(i.data_alta, i.data_entrada) AS 'dias_no_hospital',
    t.valor_diaria * (DATEDIFF(i.data_alta, i.data_entrada)) AS 'depesas_totais' FROM internacao AS i
INNER JOIN tipo_quarto AS t ON i.quarto_id = t.id
ORDER BY internacao_id;
	
#dados de internaçoes em quarto do tipo apartamento
SELECT i.data_entrada,i.procedimento,i.quarto_id AS numero_quarto,
t.descricaoquarto FROM internacao AS i 
INNER JOIN tipo_quarto AS  t  ON i.quarto_id = t.id
WHERE i.quarto_id = 1;


#pacientes que eram menor de idade e não tiveram consulta em pediatria
SELECT P.nome,C.datahora,P.datanasc,
		e.descricao_especialidade 
FROM consultas AS C
INNER JOIN pacientes AS P ON p.ID = C.id
INNER JOIN especialidades AS e ON c.id_especialidades = e.id
WHERE datanasc BETWEEN '2006-01-01' AND '2023-12-31' 
AND id_especialidades <> 1
ORDER BY C.id;
       
#dados de internações de gastroenterologia  que aconteceram em enfermaria
SELECT 	p.nome AS pacientes_nome,
	    m.nome AS medico_nome,				
        i.data_entrada,i.procedimento,i.quarto_id,
		t.descricaoquarto AS descricao,
		me.id_especialidades,
		E.descricao_especialidade AS especialidade
FROM internacao AS i
INNER JOIN pacientes AS P ON i.pacientes_id = p.id
INNER JOIN medicos AS m ON   i.medicos_id = m.id
INNER JOIN medico_especialidades AS me 
INNER JOIN especialidades AS e
INNER JOIN tipo_quarto AS t ON i.quarto_id=t.id
WHERE me.id_especialidades =3 AND quarto_id=3 
AND  E.descricao_especialidade LIKE ('%gastroenterologia%');

#dados dos medicos e quantas consultas realizaram
SELECT m.id,m.nome,m.crm,
count(c.id_medicos) AS numero_consultas
FROM medicos AS M
INNER JOIN consultas AS c ON m.id = c.id_medicos
GROUP BY m.id;

#dados de enfermeiros que participaram em mais de uma internacao	
SELECT e.nome,e.cre,
       count(ie.enfermeiro_id) as numero_internacoes_que_participou
FROM enfermeiro AS e
INNER JOIN internacao_enfermeiro AS ie ON ie.enfermeiro_id = e.id
GROUP BY e.id 
HAVING count(*) >1 ;
       
       
                #PESQUISA PESSOAL 
#para saber o tempo de carência do convenio do paciente pesquisando pelo nome.
SELECT P.nome as nome_paciente,con.nomedoconvenio,con.tempocarencia 
FROM pacientes AS P 
JOIN consultas AS C on p.id = c.id 
JOIN CONVENIOS AS con on con.id = C.id_convenios
WHERE p.nome IN ('sandro mendes');