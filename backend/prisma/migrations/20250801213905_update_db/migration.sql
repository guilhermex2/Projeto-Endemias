/*
  Warnings:

  - You are about to drop the column `criadoEm` on the `Registro` table. All the data in the column will be lost.
  - You are about to drop the column `larvicida` on the `Registro` table. All the data in the column will be lost.
  - You are about to drop the column `qtde_im_trat` on the `Registro` table. All the data in the column will be lost.
  - You are about to drop the column `setor` on the `Registro` table. All the data in the column will be lost.
  - Made the column `lado` on table `Registro` required. This step will fail if there are existing NULL values in that column.
  - Made the column `logradouro` on table `Registro` required. This step will fail if there are existing NULL values in that column.
  - Made the column `numero` on table `Registro` required. This step will fail if there are existing NULL values in that column.
  - Made the column `sequencia` on table `Registro` required. This step will fail if there are existing NULL values in that column.
  - Made the column `complemento` on table `Registro` required. This step will fail if there are existing NULL values in that column.
  - Made the column `tipo_imovel` on table `Registro` required. This step will fail if there are existing NULL values in that column.
  - Made the column `horario_entrada` on table `Registro` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "public"."Registro" DROP COLUMN "criadoEm",
DROP COLUMN "larvicida",
DROP COLUMN "qtde_im_trat",
DROP COLUMN "setor",
ADD COLUMN     "amostra_final" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "amostra_inicial" INTEGER NOT NULL DEFAULT 10,
ADD COLUMN     "atividade" TEXT NOT NULL DEFAULT '1-RA',
ADD COLUMN     "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "im_trat" INTEGER NOT NULL DEFAULT 1,
ADD COLUMN     "informacao" TEXT NOT NULL DEFAULT 'nada a informar hoje',
ADD COLUMN     "qtd_dep_trat" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "qtd_tubitos" INTEGER NOT NULL DEFAULT 15,
ADD COLUMN     "quarteirao" TEXT NOT NULL DEFAULT '1',
ADD COLUMN     "queda_gramas" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "sequencia2" TEXT NOT NULL DEFAULT '24-1',
ALTER COLUMN "lado" SET NOT NULL,
ALTER COLUMN "lado" SET DEFAULT '2',
ALTER COLUMN "logradouro" SET NOT NULL,
ALTER COLUMN "logradouro" SET DEFAULT 'Logradouro Teste 2 ',
ALTER COLUMN "numero" SET NOT NULL,
ALTER COLUMN "numero" SET DEFAULT '4',
ALTER COLUMN "sequencia" SET NOT NULL,
ALTER COLUMN "sequencia" SET DEFAULT '10/1',
ALTER COLUMN "complemento" SET NOT NULL,
ALTER COLUMN "complemento" SET DEFAULT 'Nada',
ALTER COLUMN "tipo_imovel" SET NOT NULL,
ALTER COLUMN "tipo_imovel" SET DEFAULT 'TB',
ALTER COLUMN "horario_entrada" SET NOT NULL,
ALTER COLUMN "horario_entrada" SET DEFAULT '18:33',
ALTER COLUMN "a1" SET DEFAULT 2,
ALTER COLUMN "a2" SET DEFAULT 1,
ALTER COLUMN "b" SET DEFAULT 2,
ALTER COLUMN "c" SET DEFAULT 4,
ALTER COLUMN "d1" SET DEFAULT 5,
ALTER COLUMN "d2" SET DEFAULT 3,
ALTER COLUMN "e" SET DEFAULT 2,
ALTER COLUMN "depositos_eliminados" SET DEFAULT 2,
ALTER COLUMN "insp_l1" SET DEFAULT 1;
