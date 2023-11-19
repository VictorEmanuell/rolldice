/*
  Warnings:

  - The primary key for the `defenses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `defenses` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[skill_id]` on the table `character_skills` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "attacks_character_id_key";

-- DropIndex
DROP INDEX "character_skills_character_id_skill_id_key";

-- DropIndex
DROP INDEX "characters_user_id_key";

-- AlterTable
ALTER TABLE "defenses" DROP CONSTRAINT "defenses_pkey",
DROP COLUMN "id";

-- CreateIndex
CREATE UNIQUE INDEX "character_skills_skill_id_key" ON "character_skills"("skill_id");
