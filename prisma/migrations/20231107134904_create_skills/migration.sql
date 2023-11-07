/*
  Warnings:

  - You are about to drop the column `characterId` on the `attributes` table. All the data in the column will be lost.
  - You are about to drop the `attack` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `character` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[character_id]` on the table `attributes` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `character_id` to the `attributes` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "attack" DROP CONSTRAINT "attack_characterId_fkey";

-- DropForeignKey
ALTER TABLE "attributes" DROP CONSTRAINT "attributes_characterId_fkey";

-- DropForeignKey
ALTER TABLE "character" DROP CONSTRAINT "character_userId_fkey";

-- DropForeignKey
ALTER TABLE "user_auth" DROP CONSTRAINT "user_auth_userId_username_fkey";

-- DropIndex
DROP INDEX "attributes_characterId_key";

-- AlterTable
ALTER TABLE "attributes" DROP COLUMN "characterId",
ADD COLUMN     "character_id" TEXT NOT NULL;

-- DropTable
DROP TABLE "attack";

-- DropTable
DROP TABLE "character";

-- DropTable
DROP TABLE "user";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "characters" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "level" INTEGER NOT NULL,

    CONSTRAINT "characters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attacks" (
    "characterId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "attack_bonus" INTEGER NOT NULL,
    "damage" TEXT NOT NULL,
    "extra_damage" INTEGER NOT NULL,
    "damage_type" TEXT NOT NULL,
    "damage_attribute" TEXT NOT NULL,
    "extra_dices" INTEGER NOT NULL,
    "critical" INTEGER NOT NULL,
    "critical_type" TEXT NOT NULL,
    "critical_multiplier" INTEGER NOT NULL,
    "range" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "skills" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "trained" BOOLEAN NOT NULL,
    "penalty" TEXT NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "character_skills" (
    "character_id" TEXT NOT NULL,
    "skill_id" TEXT NOT NULL,
    "attribute" TEXT NOT NULL,
    "others" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "users_id_username_key" ON "users"("id", "username");

-- CreateIndex
CREATE UNIQUE INDEX "characters_userId_key" ON "characters"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "attacks_characterId_key" ON "attacks"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "character_skills_character_id_skill_id_key" ON "character_skills"("character_id", "skill_id");

-- CreateIndex
CREATE UNIQUE INDEX "attributes_character_id_key" ON "attributes"("character_id");

-- AddForeignKey
ALTER TABLE "user_auth" ADD CONSTRAINT "user_auth_userId_username_fkey" FOREIGN KEY ("userId", "username") REFERENCES "users"("id", "username") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attacks" ADD CONSTRAINT "attacks_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character_skills" ADD CONSTRAINT "character_skills_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character_skills" ADD CONSTRAINT "character_skills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
