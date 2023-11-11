/*
  Warnings:

  - Changed the type of `trained` on the `character_skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "character_skills" DROP COLUMN "trained",
ADD COLUMN     "trained" BOOLEAN NOT NULL;
