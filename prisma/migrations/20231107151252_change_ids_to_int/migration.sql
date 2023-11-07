/*
  Warnings:

  - The primary key for the `characters` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `characters` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `skills` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `skills` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `users` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `character_id` on the `attacks` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `character_id` on the `attributes` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `character_id` on the `character_skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `skill_id` on the `character_skills` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `user_id` on the `characters` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `user_id` on the `user_auth` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "attacks" DROP CONSTRAINT "attacks_character_id_fkey";

-- DropForeignKey
ALTER TABLE "attributes" DROP CONSTRAINT "attributes_character_id_fkey";

-- DropForeignKey
ALTER TABLE "character_skills" DROP CONSTRAINT "character_skills_character_id_fkey";

-- DropForeignKey
ALTER TABLE "character_skills" DROP CONSTRAINT "character_skills_skill_id_fkey";

-- DropForeignKey
ALTER TABLE "characters" DROP CONSTRAINT "characters_user_id_fkey";

-- DropForeignKey
ALTER TABLE "user_auth" DROP CONSTRAINT "user_auth_user_id_username_fkey";

-- AlterTable
ALTER TABLE "attacks" DROP COLUMN "character_id",
ADD COLUMN     "character_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "attributes" DROP COLUMN "character_id",
ADD COLUMN     "character_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "character_skills" DROP COLUMN "character_id",
ADD COLUMN     "character_id" INTEGER NOT NULL,
DROP COLUMN "skill_id",
ADD COLUMN     "skill_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "characters" DROP CONSTRAINT "characters_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "user_id",
ADD COLUMN     "user_id" INTEGER NOT NULL,
ADD CONSTRAINT "characters_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "skills" DROP CONSTRAINT "skills_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "skills_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "user_auth" DROP COLUMN "user_id",
ADD COLUMN     "user_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "attacks_character_id_key" ON "attacks"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "attributes_character_id_key" ON "attributes"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "character_skills_character_id_skill_id_key" ON "character_skills"("character_id", "skill_id");

-- CreateIndex
CREATE UNIQUE INDEX "characters_user_id_key" ON "characters"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_auth_user_id_username_key" ON "user_auth"("user_id", "username");

-- CreateIndex
CREATE UNIQUE INDEX "users_id_username_key" ON "users"("id", "username");

-- AddForeignKey
ALTER TABLE "user_auth" ADD CONSTRAINT "user_auth_user_id_username_fkey" FOREIGN KEY ("user_id", "username") REFERENCES "users"("id", "username") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attacks" ADD CONSTRAINT "attacks_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character_skills" ADD CONSTRAINT "character_skills_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character_skills" ADD CONSTRAINT "character_skills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
