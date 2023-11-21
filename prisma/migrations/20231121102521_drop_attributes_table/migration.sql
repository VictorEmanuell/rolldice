/*
  Warnings:

  - You are about to drop the `attributes` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `charisma` to the `characters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `constitution` to the `characters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dexterity` to the `characters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `intelligence` to the `characters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `strength` to the `characters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `wisdom` to the `characters` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "attributes" DROP CONSTRAINT "attributes_character_id_fkey";

-- AlterTable
ALTER TABLE "characters" ADD COLUMN     "charisma" INTEGER NOT NULL,
ADD COLUMN     "constitution" INTEGER NOT NULL,
ADD COLUMN     "dexterity" INTEGER NOT NULL,
ADD COLUMN     "intelligence" INTEGER NOT NULL,
ADD COLUMN     "strength" INTEGER NOT NULL,
ADD COLUMN     "wisdom" INTEGER NOT NULL;

-- DropTable
DROP TABLE "attributes";
