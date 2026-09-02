CREATE TABLE IF NOT EXISTS permissoes (
    id_permissao SERIAL NOT NULL,
    nm_permissao VARCHAR(100) NOT NULL,
    CONSTRAINT PK_permissoes PRIMARY KEY (id_permissao),
    CONSTRAINT UK01_permissoes_nm_permissao UNIQUE (nm_permissao)
);
