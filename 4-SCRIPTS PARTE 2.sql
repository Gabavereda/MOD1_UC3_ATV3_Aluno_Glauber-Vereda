USE hospital_db_atv3;

ALTER TABLE medicos ADD COLUMN em_atividade BIT DEFAULT 1;
UPDATE medicos SET em_atividade=0 WHERE id=1 OR id=2;

UPDATE internacao SET data_alta=DATE_ADD(data_alta , INTERVAL  3 DAY) WHERE ID<=7;

UPDATE PACIENTES SET id_convenios =NULL  WHERE id_convenios=4;
UPDATE consultas SET id_convenios =NULL WHERE id_convenios=4;
DELETE  FROM convenios WHERE ID=4;