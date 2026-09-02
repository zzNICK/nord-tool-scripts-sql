CREATE TABLE IF NOT EXISTS empresas (
    id_empresa SERIAL NOT NULL,
    nm_empresa VARCHAR(100) NOT NULL,
    CONSTRAINT PK_empresas PRIMARY KEY (id_empresa),
    CONSTRAINT UK01_empresas_nm_empresa UNIQUE (nm_empresa)
);
