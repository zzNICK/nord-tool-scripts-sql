CREATE TABLE IF NOT EXISTS users (
    id_user SERIAL NOT NULL,
    nm_user VARCHAR(150) NOT NULL,
    nm_celular VARCHAR(20) NULL,
    id_empresa INT NOT NULL,
    id_cargo INT NOT NULL,
    id_permissao INT NOT NULL,
    CONSTRAINT PK_users PRIMARY KEY (id_user),
    CONSTRAINT FK01_empresa_x_users
        FOREIGN KEY (id_empresa)
        REFERENCES empresas (id_empresa),
    CONSTRAINT FK02_cargo_x_users
        FOREIGN KEY (id_cargo)
        REFERENCES cargos (id_cargo),
    CONSTRAINT FK03_permissao_x_users
        FOREIGN KEY (id_permissao)
        REFERENCES permissoes (id_permissao)
);

CREATE INDEX IF NOT EXISTS IDX01_users_empresa ON users (id_empresa);
CREATE INDEX IF NOT EXISTS IDX02_users_cargo ON users (id_cargo);
CREATE INDEX IF NOT EXISTS IDX03_users_permissao ON users (id_permissao);
