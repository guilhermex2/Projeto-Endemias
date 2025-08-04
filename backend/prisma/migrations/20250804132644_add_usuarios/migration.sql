/*
  Warnings:

  - You are about to drop the column `agente` on the `Turno` table. All the data in the column will be lost.
  - Added the required column `usuarioId` to the `Turno` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "public"."Registro" ALTER COLUMN "lado" DROP DEFAULT,
ALTER COLUMN "logradouro" DROP DEFAULT,
ALTER COLUMN "numero" DROP DEFAULT,
ALTER COLUMN "sequencia" DROP DEFAULT,
ALTER COLUMN "complemento" DROP DEFAULT,
ALTER COLUMN "tipo_imovel" DROP DEFAULT,
ALTER COLUMN "horario_entrada" DROP DEFAULT,
ALTER COLUMN "a1" DROP DEFAULT,
ALTER COLUMN "a2" DROP DEFAULT,
ALTER COLUMN "b" DROP DEFAULT,
ALTER COLUMN "c" DROP DEFAULT,
ALTER COLUMN "d1" DROP DEFAULT,
ALTER COLUMN "d2" DROP DEFAULT,
ALTER COLUMN "e" DROP DEFAULT,
ALTER COLUMN "depositos_eliminados" DROP DEFAULT,
ALTER COLUMN "insp_l1" DROP DEFAULT,
ALTER COLUMN "amostra_final" DROP DEFAULT,
ALTER COLUMN "amostra_inicial" DROP DEFAULT,
ALTER COLUMN "atividade" DROP DEFAULT,
ALTER COLUMN "data" DROP DEFAULT,
ALTER COLUMN "im_trat" DROP DEFAULT,
ALTER COLUMN "informacao" DROP DEFAULT,
ALTER COLUMN "qtd_dep_trat" DROP DEFAULT,
ALTER COLUMN "qtd_tubitos" DROP DEFAULT,
ALTER COLUMN "quarteirao" DROP DEFAULT,
ALTER COLUMN "queda_gramas" DROP DEFAULT,
ALTER COLUMN "sequencia2" DROP DEFAULT;

-- AlterTable
ALTER TABLE "public"."Turno" DROP COLUMN "agente",
ADD COLUMN     "usuarioId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "public"."Usuario" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_nome_key" ON "public"."Usuario"("nome");

-- AddForeignKey
ALTER TABLE "public"."Turno" ADD CONSTRAINT "Turno_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "public"."Usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE;
