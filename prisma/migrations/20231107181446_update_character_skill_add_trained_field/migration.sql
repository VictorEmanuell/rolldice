/*
  Warnings:

  - Added the required column `trained` to the `character_skills` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "character_skills" ADD COLUMN     "trained" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "defenses" (
    "id" SERIAL NOT NULL,
    "character_id" INTEGER NOT NULL,
    "slot1_name" TEXT NOT NULL,
    "slot1_defense" INTEGER NOT NULL,
    "slot1_penalty" INTEGER NOT NULL,
    "slot2_name" TEXT NOT NULL,
    "slot2_defense" INTEGER NOT NULL,
    "slot2_penalty" INTEGER NOT NULL,
    "attribute" TEXT NOT NULL,
    "use_atribute" BOOLEAN NOT NULL,
    "other" INTEGER NOT NULL,

    CONSTRAINT "defenses_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "defenses_character_id_key" ON "defenses"("character_id");

-- AddForeignKey
ALTER TABLE "defenses" ADD CONSTRAINT "defenses_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
