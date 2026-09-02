CREATE TABLE IF NOT EXISTS cargos (
    id_cargo SERIAL NOT NULL,
    nm_cargo VARCHAR(100) NOT NULL,
    CONSTRAINT PK_cargos PRIMARY KEY (id_cargo),
    CONSTRAINT UK01_cargos_nm_cargo UNIQUE (nm_cargo)
);
