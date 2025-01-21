USE hospital_db_atv3;

ALTER TABLE pacientes ADD id_convenios INT DEFAULT NULL;
ALTER TABLE pacientes ADD FOREIGN KEY (id_convenios) REFERENCES convenios(id);

ALTER TABLE consultas ADD (id_convenios INT  NULL,
						  id_especialidades INT NOT NULL,
						  id_medicos INT NOT NULL);

ALTER TABLE consultas ADD FOREIGN KEY (id_convenios)
                      REFERENCES convenios(id);   
ALTER TABLE consultas ADD FOREIGN KEY (id_especialidades)
                      REFERENCES especialidades(id);
ALTER TABLE consultas ADD FOREIGN KEY (id_medicos)
                      REFERENCES medicos(id);  
                      
ALTER TABLE consultas ADD  id_pacientes INT NOT NULL;
ALTER TABLE consultas ADD FOREIGN KEY (id_pacientes) REFERENCES pacientes(id);                      

ALTER TABLE receitas  ADD  id_consultas INT NOT NULL;
ALTER TABLE receitas ADD FOREIGN KEY (id_consultas)
                      REFERENCES consultas(id);
                      
ALTER TABLE medico_especialidades ADD (id_especialidades INT NOT NULL,
                                       id_medicos INT NOT NULL);
ALTER TABLE medico_especialidades ADD FOREIGN KEY (id_especialidades)
					              REFERENCES especialidades(id);
ALTER TABLE medico_especialidades ADD FOREIGN KEY (id_medicos)
								  REFERENCES medicos(id);

ALTER TABLE internacao ADD (quarto_id INT NOT NULL,
							pacientes_id INT NOT NULL,
                            medicos_id INT NOT NULL);
ALTER TABLE internacao ADD FOREIGN KEY (quarto_id)
						REFERENCES quartos(id);
ALTER TABLE internacao ADD FOREIGN KEY (pacientes_id)
						REFERENCES pacientes(id);
ALTER TABLE internacao ADD FOREIGN KEY (medicos_id)
						REFERENCES medicos(id);
						
ALTER TABLE quartos ADD (tipo_quarto_id INT DEFAULT NULL);
ALTER TABLE quartos ADD FOREIGN KEY (tipo_quarto_id)
					REFERENCES tipo_quarto(id);
             
ALTER TABLE internacao_enfermeiro ADD (internacao_id INT NOT NULL,
										enfermeiro_id INT NOT NULL);
ALTER TABLE internacao_enfermeiro ADD FOREIGN KEY (internacao_id)
									REFERENCES internacao(id);
ALTER TABLE internacao_enfermeiro ADD FOREIGN KEY (enfermeiro_id)
									REFERENCES enfermeiro(id);