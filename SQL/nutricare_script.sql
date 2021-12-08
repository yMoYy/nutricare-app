CREATE SCHEMA `nutricare_app` DEFAULT CHARACTER SET utf8mb4;
USE `nutricare_app`;

-- -----------------------------------------------------
-- Table `nutricare_app`.`paciente`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`paciente` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `txt_nombre` VARCHAR(20) NOT NULL,
  `txt_apellido_paterno` VARCHAR(10) NOT NULL,
  `txt_apellido_materno` VARCHAR(10) NOT NULL,
  `txt_genero` enum('M','F') NOT NULL,
  `txt_edo_civil` enum('Soltero','Casado','Divorciado','Viudo','Concubinato') NOT NULL,
  `int_celular` BIGINT UNSIGNED NOT NULL,
  `txt_correo` VARCHAR(30) NOT NULL,
  `d_fecha_nacimiento` DATE NOT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE INDEX `int_celular_UNIQUE` (`int_celular` ASC) VISIBLE,
  UNIQUE INDEX `txt_correo_UNIQUE` (`txt_correo` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`cita`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`cita` (
  `id_cita` INT NOT NULL AUTO_INCREMENT,
  `txt_descripcion_cita` VARCHAR(100) NOT NULL,
  `d_fecha_cita` DATE NOT NULL,
  `t_hora_cita` TIME NOT NULL,
  `dec_costo_cita` DECIMAL(7,2) NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_cita`),
  INDEX `fk_cita_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_cita_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`hc_enfermedad`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`hc_enfermedad` (
  `id_enfermedad` INT NOT NULL AUTO_INCREMENT,
  `bln_cardiaca_enf` TINYINT NOT NULL,
  `bln_vascular_enf` TINYINT NOT NULL,
  `bln_cerebro_enf` TINYINT NOT NULL,
  `bln_epoc_enf` TINYINT NOT NULL,
  `bln_asma_enf` TINYINT NOT NULL,
  `bln_pulmonar_enf` TINYINT NOT NULL,
  `bln_fibrosis_enf` TINYINT NOT NULL,
  `bln_dm_enf` TINYINT NOT NULL,
  `bln_tiroides_enf` TINYINT NOT NULL,
  `bln_renal_enf` TINYINT NOT NULL,
  `bln_hepatica_enf` TINYINT NOT NULL,
  `bln_sindrome_enf` TINYINT NOT NULL,
  PRIMARY KEY (`id_enfermedad`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`hc_signo_sintoma`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`hc_signo_sintoma` (
  `id_signos_sintomas` INT NOT NULL AUTO_INCREMENT,
  `bln_dom_ss` TINYINT NOT NULL,
  `bln_disnea_ss` TINYINT NOT NULL,
  `bln_mareos_ss` TINYINT NOT NULL,
  `bln_ortopnea_ss` TINYINT NOT NULL,
  `bln_edema_ss` TINYINT NOT NULL,
  `bln_palpitaciones_ss` TINYINT NOT NULL,
  `bln_claudicacion_ss` TINYINT NOT NULL,
  `bln_fatiga_ss` TINYINT NOT NULL,
  PRIMARY KEY (`id_signos_sintomas`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`hc_factor_riesgo`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`hc_factor_riesgo` (
  `id_factores_riesgo` INT NOT NULL AUTO_INCREMENT,
  `bln_edad_m_fr` TINYINT NOT NULL,
  `bln_edad_f_fr` TINYINT NOT NULL,
  `bln_tabaquismo_fr` TINYINT NOT NULL,
  `bln_sed_md_fr` TINYINT NOT NULL,
  `bln_sed_ds_fr` TINYINT NOT NULL,
  `bln_sed_m_fr` TINYINT NOT NULL,
  `bln_obesidad_m_fr` TINYINT NOT NULL,
  `bln_obesidad_f_fr` TINYINT NOT NULL,
  `bld_has_fr` TINYINT NOT NULL,
  `bld_ldl_fr` TINYINT NOT NULL,
  `bld_hdl_fr` TINYINT NOT NULL,
  `bld_colesterol_fr` TINYINT NOT NULL,
  `bld_glucosa_fr` TINYINT NOT NULL,
  `bld_edad_fam_fr` TINYINT NOT NULL,
  `bld_iam_fr` TINYINT NOT NULL,
  `bld_muerte_fr` TINYINT NOT NULL,
  `bld_revascula_fr` TINYINT NOT NULL,
  PRIMARY KEY (`id_factores_riesgo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`hc_actividad_fisica`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`hc_actividad_fisica` (
  `id_actividad_fisica` INT NOT NULL AUTO_INCREMENT,
  `txt_af_tipo_af` VARCHAR(20) NOT NULL,
  `int_frecuencia_vs_af` INT UNSIGNED NOT NULL,
  `t_cantidad_hd_af` TIME NOT NULL,
  `txt_observaciones_af` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_actividad_fisica`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`historia_clinica`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`historia_clinica` (
  `id_historia_clinica` INT NOT NULL AUTO_INCREMENT,
  `d_registro_hc` DATE NOT NULL,
  `id_enfermedad` INT NOT NULL,
  `id_signos_sintomas` INT NOT NULL,
  `id_factores_riesgo` INT NOT NULL,
  `id_actividad_fisica` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_historia_clinica`),
  INDEX `fk_hc_enfermedad_idx` (`id_enfermedad` ASC) VISIBLE,
  INDEX `fk_hc_signo_sintoma_idx` (`id_signos_sintomas` ASC) VISIBLE,
  INDEX `fk_hc_factor_riesgo_idx` (`id_factores_riesgo` ASC) VISIBLE,
  INDEX `fk_hc_actividad_fisica_idx` (`id_actividad_fisica` ASC) VISIBLE,
  INDEX `fk_hc_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_hc_enfermedad`
    FOREIGN KEY (`id_enfermedad`)
    REFERENCES `nutricare_app`.`hc_enfermedad` (`id_enfermedad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hc_signo_sintoma`
    FOREIGN KEY (`id_signos_sintomas`)
    REFERENCES `nutricare_app`.`hc_signo_sintoma` (`id_signos_sintomas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hc_factor_riesgo`
    FOREIGN KEY (`id_factores_riesgo`)
    REFERENCES `nutricare_app`.`hc_factor_riesgo` (`id_factores_riesgo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hc_actividad_fisica`
    FOREIGN KEY (`id_actividad_fisica`)
    REFERENCES `nutricare_app`.`hc_actividad_fisica` (`id_actividad_fisica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hc_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`frn_vicio`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`frn_vicio` (
  `id_vicios` INT NOT NULL AUTO_INCREMENT,
  `txt_medicamentos_vic` VARCHAR(50) NOT NULL,
  `bln_tabaquismo_vic` TINYINT NOT NULL,
  `int_cigarros_vic` INT UNSIGNED NULL,
  `bln_drogas_vic` TINYINT NOT NULL,
  `int_drogas_vic` INT UNSIGNED NULL,
  `bln_alcohol_vic` TINYINT NOT NULL,
  `int_alcohol_vic` INT UNSIGNED NULL,
  `bln_cafe_vic` TINYINT NOT NULL,
  `bln_te_vic` TINYINT NOT NULL,
  PRIMARY KEY (`id_vicios`))
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`frn_habito_dietetico`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`frn_habito_dietetico` (
  `id_habitos_dieteticos` INT NOT NULL AUTO_INCREMENT,
  `bln_mod_peso_hd` TINYINT NOT NULL,
  `dec_peso_hd` DECIMAL(5,2) NOT NULL,
  `dec_peso_min_hd` DECIMAL(5,2) NOT NULL,
  `dec_peso_max_hd` DECIMAL(5,2) NOT NULL,
  `txt_dietas_meds_hd` VARCHAR(70) NOT NULL,
  `txt_razones_hd` VARCHAR(70) NOT NULL,
  `txt_alm_i_hd` VARCHAR(70) NOT NULL,
  `txt_alm_g_hd` VARCHAR(70) NOT NULL,
  `txt_alm_d_hd` VARCHAR(70) NOT NULL,
  `txt_alergia_hd` VARCHAR(50) NOT NULL,
  `txt_encargado_hd` VARCHAR(30) NOT NULL,
  `txt_compañero_hd` VARCHAR(30) NOT NULL,
  `int_comidas_hd` INT UNSIGNED NOT NULL,
  `bln_alm_sal_hd` TINYINT NOT NULL,
  `txt_hambre_hd` VARCHAR(20) NOT NULL,
  `txt_observaciones_hd` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_habitos_dieteticos`))
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`factor_riesgo_nutrimental`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`factor_riesgo_nutrimental` (
  `id_factor_riesgo_nut` INT NOT NULL AUTO_INCREMENT,
  `d_registro_frn` DATE NOT NULL,
  `id_vicios` INT NOT NULL,
  `id_habitos_dieteticos` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_factor_riesgo_nut`),
  INDEX `fk_frn_vicio_idx` (`id_vicios` ASC) VISIBLE,
  INDEX `fk_frn_habito_dietetico_idx` (`id_habitos_dieteticos` ASC) VISIBLE,
  INDEX `fk_frn_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_frn_vicio`
    FOREIGN KEY (`id_vicios`)
    REFERENCES `nutricare_app`.`frn_vicio` (`id_vicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frn_habito_dietetico`
    FOREIGN KEY (`id_habitos_dieteticos`)
    REFERENCES `nutricare_app`.`frn_habito_dietetico` (`id_habitos_dieteticos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frn_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`die_frec_cons_alim_semana`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`die_frec_cons_alim_semana` (
  `id_fca_vxs` INT NOT NULL AUTO_INCREMENT,
  `int_tortilla_fca_xs` INT UNSIGNED NOT NULL,
  `int_pan_fca_xs` INT UNSIGNED NOT NULL,
  `int_galleta_fca_xs` INT UNSIGNED NOT NULL,
  `int_arroz_fca_xs` INT UNSIGNED NOT NULL,
  `int_pasta_fca_xs` INT UNSIGNED NOT NULL,
  `int_cereal_fca_xs` INT UNSIGNED NOT NULL,
  `int_pan_sdw_fca_xs` INT UNSIGNED NOT NULL,
  `int_cereal_gsa_fca_xs` INT UNSIGNED NOT NULL,
  `int_leguminosa_fca_xs` INT UNSIGNED NOT NULL,
  `int_fruta_fca_xs` INT UNSIGNED NOT NULL,
  `int_verdura_fca_xs` INT UNSIGNED NOT NULL,
  `int_res_fca_xs` INT UNSIGNED NOT NULL,
  `int_pollo_fca_xs` INT UNSIGNED NOT NULL,
  `int_pescado_fca_xs` INT UNSIGNED NOT NULL,
  `int_marisco_fca_xs` INT UNSIGNED NOT NULL,
  `int_huevo_fca_xs` INT UNSIGNED NOT NULL,
  `int_embutido_fca_xs` INT UNSIGNED NOT NULL,
  `int_queso_fca_xs` INT UNSIGNED NOT NULL,
  `int_leche_fca_xs` INT UNSIGNED NOT NULL,
  `int_grasa_fca_xs` INT UNSIGNED NOT NULL,
  `int_azucar_fca_xs` INT UNSIGNED NOT NULL,
  `int_alm_fca_xs` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_fca_vxs`))
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`die_frec_cons_alim_dia`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`die_frec_cons_alim_dia` (
  `id_fca_vxd` INT NOT NULL AUTO_INCREMENT,
  `dec_tortilla_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_pan_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_galleta_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_arroz_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_pasta_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_cereal_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_pan_sdw_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_cereal_gsa_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_leguminosa_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_fruta_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_verdura_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_res_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_pollo_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_pescado_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_marisco_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_huevo_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_embutido_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_queso_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_leche_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_grasa_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_azucar_fca_xd` DECIMAL(5,1) NOT NULL,
  `dec_alm_fca_xd` DECIMAL(5,1) NOT NULL,
  PRIMARY KEY (`id_fca_vxd`))
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`dieta`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`dieta` (
  `id_dieta` INT NOT NULL AUTO_INCREMENT,
  `d_registro_die` DATE NOT NULL,
  `id_fca_vxs` INT NOT NULL,
  `id_fca_cxd` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_dieta`),
  INDEX `fk_die_fca_vxs_idx` (`id_fca_vxs` ASC) VISIBLE,
  INDEX `fk_die_fca_vxd_idx` (`id_fca_cxd` ASC) VISIBLE,
  INDEX `fk_die_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_die_fca_vxs`
    FOREIGN KEY (`id_fca_vxs`)
    REFERENCES `nutricare_app`.`die_frec_cons_alim_semana` (`id_fca_vxs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_die_fca_vxd`
    FOREIGN KEY (`id_fca_cxd`)
    REFERENCES `nutricare_app`.`die_frec_cons_alim_dia` (`id_fca_vxd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_die_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`die_recordatorio`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`die_recordatorio` (
  `id_recordatorio` INT NOT NULL AUTO_INCREMENT,
  `txt_alm_rcd` VARCHAR(20) NOT NULL,
  `txt_tipo_rcd` VARCHAR(20) NOT NULL,
  `txt_marca_rcd` VARCHAR(20) NOT NULL,
  `int_cantidad_mc_rcd` INT NOT NULL,
  `dec_cantidad_mm_rcd` DECIMAL(5,1) NOT NULL,
  `id_dieta` INT NOT NULL,
  PRIMARY KEY (`id_recordatorio`),
  INDEX `fk_rcd_die_idx` (`id_dieta` ASC) VISIBLE,
  CONSTRAINT `fk_rcd_die`
    FOREIGN KEY (`id_dieta`)
    REFERENCES `nutricare_app`.`dieta` (`id_dieta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`ant_historial_peso`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`ant_historial_peso` (
  `id_historial_peso` INT NOT NULL AUTO_INCREMENT,
  `dec_peso_hp` DECIMAL(5,2) NOT NULL,
  `dec_peso_ideal_hp` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id_historial_peso`))
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`antropometria`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`antropometria` (
  `id_antropometria` INT NOT NULL AUTO_INCREMENT,
  `d_registro_ant` DATE NOT NULL,
  `id_historial_peso` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_antropometria`),
  INDEX `fk_ant_hp_idx` (`id_historial_peso` ASC) VISIBLE,
  INDEX `fk_ant_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_ant_hp`
    FOREIGN KEY (`id_historial_peso`)
    REFERENCES `nutricare_app`.`ant_historial_peso` (`id_historial_peso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ant_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`ant_cambio_peso`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`ant_cambio_peso` (
  `id_cambio_peso` INT NOT NULL AUTO_INCREMENT,
  `d_registro_cp` DATE NOT NULL,
  `dec_peso_cp` DECIMAL(5,2) NOT NULL,
  `dec_talla_cp` DECIMAL(5,2) NOT NULL,
  `dec_imc_cp` DECIMAL(5,2) NOT NULL,	
  `dec_cintura_cp` DECIMAL(5,2) NOT NULL,
  `dec_brazo_cp` DECIMAL(5,2) NOT NULL,
  `dec_tricep_cp` DECIMAL(5,2) NOT NULL,
  `dec_bicep_cp` DECIMAL(5,2) NOT NULL,
  `dec_subescapular_cp` DECIMAL(5,2) NOT NULL,
  `dec_suprailiaco_cp` DECIMAL(5,2) NOT NULL,
  `dec_abdominal_cp` DECIMAL(5,2) NOT NULL,
  `dec_grasa_cp` DECIMAL(5,2) NOT NULL,
  `id_antropometria` INT NOT NULL,
  PRIMARY KEY (`id_cambio_peso`),
  INDEX `fk_cp_ant_idx` (`id_antropometria` ASC) VISIBLE,
  CONSTRAINT `fk_cp_ant`
    FOREIGN KEY (`id_antropometria`)
    REFERENCES `nutricare_app`.`antropometria` (`id_antropometria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`estudio_laboratorio`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`estudio_laboratorio` (
  `id_estudio_lab` INT NOT NULL AUTO_INCREMENT,
  `d_registro_lab` DATE NOT NULL,
  `dec_glucosa_lab` DECIMAL (5,2) NOT NULL,
  `dec_insulina_lab` DECIMAL (5,2) NOT NULL,
  `dec_trigliceridos_lab` DECIMAL (5,2) NOT NULL,
  `dec_colesterol_lab` DECIMAL (5,2) NOT NULL,
  `dec_hdl_lab` DECIMAL (5,2) NOT NULL,
  `dec_ldl_lab` DECIMAL (5,2) NOT NULL,
  `txt_otros_datos_lab` VARCHAR(60) NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_estudio_lab`),
  INDEX `fk_lab_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_lab_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Table `nutricare_app`.`diagnostico_paciente`
-- -----------------------------------------------------
CREATE TABLE `nutricare_app`.`diagnostico_paciente` (
  `id_diagnostico_paciente` INT NOT NULL AUTO_INCREMENT,
  `d_registro_dp` DATE NOT NULL,
  `txt_diagnostico_dp` VARCHAR(150) NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`id_diagnostico_paciente`),
  INDEX `fk_dp_paciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_dp_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `nutricare_app`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE InnoDB;

-- -----------------------------------------------------
-- Inserts `nutricare_app`.`diagnostico_paciente`
-- -----------------------------------------------------
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@1', 'test@1AP', 'test@1AM', 'M', 'Casado', '5509328418', 'test1@test.com', '2000/02/17');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@2', 'test@2AP', 'test@2AM', 'F', 'Soltero', '5598342721', 'test2@test.com', '1994/08/01');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@3', 'test@3AP', 'test@3AM', 'M', 'Divorciado', '5510294728', 'test3@test.com', '1998/02/27');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@4', 'test@4AP', 'test@4AM', 'F', 'Divorciado', '5512984732', 'test4@test.com', '2001/07/12');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@5', 'test@5AP', 'test@5AM', 'M', 'Casado', '5509001234', 'test5@test.com', '2005/12/30');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@6', 'test@6AP', 'test@6AM', 'F', 'Soltero', '5576902483', 'test6@test.com', '1998/06/14');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@7', 'test@7AP', 'test@7AM', 'M', 'Casado', '5500128362', 'test7@test.com', '1998/05/15');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@8', 'test@8AP', 'test@8AM', 'F', 'Concubinato', '5590238271', 'test8@test.com', '1999/09/07');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@9', 'test@9AP', 'test@9AM', 'M', 'Casado', '5536423728', 'test9@test.com', '1992/10/16');
INSERT INTO `nutricare_app`.`paciente` (`txt_nombre`, `txt_apellido_paterno`, `txt_apellido_materno`, `txt_genero`, `txt_edo_civil`, `int_celular`, `txt_correo`, `d_fecha_nacimiento`) 
VALUES ('test@10', 'test@10AP', 'test@10AM', 'F', 'Soltero', '5553870987', 'test10@test.com', '1989/04/28');


