-- mysql workbench forward engineering


-- -----------------------------------------------------
-- schema proyectoexcelencia_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- schema proyectoexcelencia_db
-- -----------------------------------------------------
-- create schema proyectoexcelencia_db;
-- use proyectoexcelencia_db;



-- -----------------------------------------------------
-- table niveles_dificultad
-- -----------------------------------------------------
create table niveles_dificultad (
  id_niveles_dificultad int not null,
  nombre varchar(45) null default null,
  primary key (id_niveles_dificultad))
  organize by row;

-- -----------------------------------------------------
-- table niveles_interes
-- -----------------------------------------------------
create table niveles_interes (
  id_niveles_interes int not null,
  nombre varchar(45) null default null,
  primary key (id_niveles_interes))
  organize by row;


-- -----------------------------------------------------
-- table usuario
-- -----------------------------------------------------
create table usuario (
  id_usuario int not null,
  nombre varchar(45) null default null,
  apellidos varchar(100) null default null,
  nombre_usuario varchar(45) null default null,
  cryp varchar(500) null default null,
  primary key (id_usuario))
  organize by row;


-- -----------------------------------------------------
-- table tipo_actividad
-- -----------------------------------------------------
create table tipo_actividad (
  id_tipo_actividad int not null,
  nombre varchar(45) null default null,
  primary key (id_tipo_actividad))
  organize by row;


-- -----------------------------------------------------
-- table asignatura
-- -----------------------------------------------------
create table asignatura (
  id_asignatura int not null,
  nombre varchar(45) null default null,
  profesor varchar(145) null default null,
  curso varchar(45) null default null,
  primary key (id_asignatura))
  organize by row;


-- -----------------------------------------------------
-- table actividad
-- -----------------------------------------------------
create table actividad (
  id_actividad int not null,
  horas_en_bruto double null default null,
  horas_diarias double null default null,
  horas_dia_anterior double null default null,
  dias_estudio double null default null,
  k double null default null,
  tema int not null,
  tipo_actividad int not null,
  asignatura int not null,
  primary key (id_actividad),
    foreign key (tipo_actividad)
    references tipo_actividad 
    on delete no action
    on update no action,
    foreign key (asignatura)
    references asignatura
    on delete no action
    on update no action)
  organize by row;




-- -----------------------------------------------------
-- table interes
-- -----------------------------------------------------
create table interes (
  id_interes int not null,
  nivel_interes int not null,
  primary key (id_interes),
    foreign key (nivel_interes)
    references niveles_interes 
    on delete no action
    on update no action)
  organize by row;



-- -----------------------------------------------------
-- table dificultad
-- -----------------------------------------------------
create table dificultad (
  id_dificultad int not null,
  nivel_dificultad int not null,
  primary key (id_dificultad),
    foreign key (nivel_dificultad)
    references niveles_dificultad
    on delete no action
    on update no action)
  organize by row;


-- -----------------------------------------------------
-- table valoracion_objetiva
-- -----------------------------------------------------
create table valoracion_objetiva (
  id_valoracion_objetiva int not null,
  nombre varchar(45) null default null,
  primary key (id_valoracion_objetiva))
  organize by row;


-- -----------------------------------------------------
-- table valoracion_subjetiva
-- -----------------------------------------------------
create table valoracion_subjetiva (
  id_valoracion_subjetiva int not null,
  nombre varchar(45) null default null,
  primary key (id_valoracion_subjetiva))
  organize by row;


-- -----------------------------------------------------
-- table semana_especial
-- -----------------------------------------------------
create table semana_especial (
  id_semana_especial int not null,
  fecha_ini date null default null,
  fecha_fin date null default null,
  nombre varchar(45) null default null,
  descripcion varchar(200) null default null,
  primary key (id_semana_especial))
  organize by row;


-- -----------------------------------------------------
-- table instancia_actividad
-- -----------------------------------------------------
create table instancia_actividad (
  id_instancia_actividad int not null,
  fecha date null default null,
  tiempo_horas double null default null,
  horas_en_bruto double null default null,
  dias_de_estudio double null default null,
  horas_diarias double null default null,
  horas_dia_anterior double null default null,
  semana_especial boolean null default null,
  valoracion_completa boolean null default null,
  k double null default null,
  actividad int not null,
  valoracion_subjetiva int not null,
  valoracion_objetiva int not null,
  usuario int not null,
  dificultad int not null,
  interes int not null,
  primary key (id_instancia_actividad),
    foreign key (actividad)
    references actividad 
    on delete no action
    on update no action,
    foreign key (valoracion_subjetiva)
    references valoracion_subjetiva
    on delete no action
    on update no action,
    foreign key (valoracion_objetiva)
    references valoracion_objetiva
    on delete no action
    on update no action,
    foreign key (usuario)
    references usuario 
    on delete no action
    on update no action,
    foreign key (dificultad)
    references dificultad 
    on delete no action
    on update no action,
    foreign key (interes)
    references interes
    on delete no action
    on update no action)
  organize by row;

