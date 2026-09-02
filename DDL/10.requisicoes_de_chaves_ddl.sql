CREATE TABLE IF NOT EXISTS requisicoes_de_chaves (
    id_requisicao SERIAL NOT NULL,
    cd_retirada VARCHAR(20) NOT NULL,
    dt_retirada TIMESTAMP NOT NULL,
    dt_recebimento TIMESTAMP NULL,
    id_apartamento_vistoria BIGINT NOT NULL,
    id_user_retirada INTEGER NOT NULL,
    id_user_liberacao INTEGER NOT NULL,
    id_user_recebimento INTEGER NULL,
    st_requisicao VARCHAR(20) NOT NULL DEFAULT 'ABERTO',
    CONSTRAINT PK_requisicoes_de_chaves PRIMARY KEY (id_requisicao),
    CONSTRAINT UK01_requisicoes_de_chaves_cd_retirada UNIQUE (cd_retirada),
    CONSTRAINT FK01_apartamento_vistoria_x_requisicoes_de_chaves
        FOREIGN KEY (id_apartamento_vistoria)
        REFERENCES apartamento_vistoria (id_apartamento_vistoria),
    CONSTRAINT FK02_user_retirada_x_requisicoes_de_chaves
        FOREIGN KEY (id_user_retirada)
        REFERENCES users (id_user),
    CONSTRAINT FK03_user_liberacao_x_requisicoes_de_chaves
        FOREIGN KEY (id_user_liberacao)
        REFERENCES users (id_user),
    CONSTRAINT FK04_user_recebimento_x_requisicoes_de_chaves
        FOREIGN KEY (id_user_recebimento)
        REFERENCES users (id_user),
    CONSTRAINT CK01_requisicoes_de_chaves_status
        CHECK (st_requisicao IN ('ABERTO', 'RECEBIDO')),
    CONSTRAINT CK02_requisicoes_de_chaves_datas
        CHECK (
            (st_requisicao = 'ABERTO'
                AND dt_recebimento IS NULL
                AND id_user_recebimento IS NULL)
            OR
            (st_requisicao = 'RECEBIDO'
                AND dt_recebimento IS NOT NULL)
        )
);

CREATE UNIQUE INDEX IF NOT EXISTS UX01_requisicoes_de_chaves_apartamento_aberto
    ON requisicoes_de_chaves (id_apartamento_vistoria)
    WHERE st_requisicao = 'ABERTO';

CREATE INDEX IF NOT EXISTS IDX01_requisicoes_de_chaves_data
    ON requisicoes_de_chaves (dt_retirada DESC);

CREATE INDEX IF NOT EXISTS IDX02_requisicoes_de_chaves_status
    ON requisicoes_de_chaves (st_requisicao);
