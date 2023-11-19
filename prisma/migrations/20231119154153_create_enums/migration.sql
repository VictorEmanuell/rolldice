/*
  Warnings:

  - You are about to drop the column `critical` on the `attacks` table. All the data in the column will be lost.
  - You are about to drop the column `other` on the `defenses` table. All the data in the column will be lost.
  - Added the required column `critical_value` to the `attacks` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `damage_type` on the `attacks` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `damage_attribute` on the `attacks` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `range` on the `attacks` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `attribute` on the `character_skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `class` on the `characters` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `others` to the `defenses` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `attribute` on the `defenses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "Classes" AS ENUM ('Arcanista', 'Barbaro', 'Bardo', 'Bucaneiro', 'Cacador', 'Cavaleiro', 'Clerigo', 'Druida', 'Guerreiro', 'Inventor', 'Ladino', 'Lutador', 'Nobre', 'Paladino');

-- CreateEnum
CREATE TYPE "Attributes" AS ENUM ('FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR');

-- CreateEnum
CREATE TYPE "Ranges" AS ENUM ('Curto', 'Medio', 'Longo', 'Outro');

-- CreateEnum
CREATE TYPE "DamageTypes" AS ENUM ('Perfuracao', 'Corte', 'Impacto', 'Outro');

-- AlterTable
ALTER TABLE "attacks" DROP COLUMN "critical",
ADD COLUMN     "critical_value" INTEGER NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "damage_type",
ADD COLUMN     "damage_type" "DamageTypes" NOT NULL,
DROP COLUMN "damage_attribute",
ADD COLUMN     "damage_attribute" "Attributes" NOT NULL,
DROP COLUMN "range",
ADD COLUMN     "range" "Ranges" NOT NULL,
ADD CONSTRAINT "attacks_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "character_skills" DROP COLUMN "attribute",
ADD COLUMN     "attribute" "Attributes" NOT NULL;

-- AlterTable
ALTER TABLE "characters" DROP COLUMN "class",
ADD COLUMN     "class" "Classes" NOT NULL;

-- AlterTable
ALTER TABLE "defenses" DROP COLUMN "other",
ADD COLUMN     "others" INTEGER NOT NULL,
DROP COLUMN "attribute",
ADD COLUMN     "attribute" "Attributes" NOT NULL;
