-- CreateTable
CREATE TABLE "public"."Turno" (
    "id" TEXT NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "municipio" TEXT NOT NULL,
    "ciclo" INTEGER NOT NULL,
    "localidade" TEXT NOT NULL,
    "categoria_localidade" TEXT NOT NULL,
    "zona" TEXT NOT NULL,
    "atividade" TEXT NOT NULL,
    "concluida" BOOLEAN NOT NULL,
    "agente" TEXT NOT NULL,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Turno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Registro" (
    "id" TEXT NOT NULL,
    "turnoId" TEXT NOT NULL,
    "setor" TEXT,
    "lado" TEXT,
    "logradouro" TEXT,
    "numero" TEXT,
    "sequencia" TEXT,
    "complemento" TEXT,
    "tipo_imovel" TEXT,
    "horario_entrada" TEXT,
    "a1" INTEGER NOT NULL DEFAULT 0,
    "a2" INTEGER NOT NULL DEFAULT 0,
    "b" INTEGER NOT NULL DEFAULT 0,
    "c" INTEGER NOT NULL DEFAULT 0,
    "d1" INTEGER NOT NULL DEFAULT 0,
    "d2" INTEGER NOT NULL DEFAULT 0,
    "e" INTEGER NOT NULL DEFAULT 0,
    "depositos_eliminados" INTEGER NOT NULL DEFAULT 0,
    "insp_l1" INTEGER NOT NULL DEFAULT 0,
    "larvicida" TEXT,
    "qtde_im_trat" INTEGER NOT NULL DEFAULT 0,
    "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Registro_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "public"."Registro" ADD CONSTRAINT "Registro_turnoId_fkey" FOREIGN KEY ("turnoId") REFERENCES "public"."Turno"("id") ON DELETE CASCADE ON UPDATE CASCADE;
