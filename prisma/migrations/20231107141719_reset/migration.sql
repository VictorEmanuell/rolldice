/*
  Warnings:

  - You are about to drop the column `characterId` on the `attacks` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `characters` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `user_auth` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[character_id]` on the table `attacks` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `characters` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id,username]` on the table `user_auth` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `character_id` to the `attacks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `characters` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `user_auth` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "attacks" DROP CONSTRAINT "attacks_characterId_fkey";

-- DropForeignKey
ALTER TABLE "characters" DROP CONSTRAINT "characters_userId_fkey";

-- DropForeignKey
ALTER TABLE "user_auth" DROP CONSTRAINT "user_auth_userId_username_fkey";

-- DropIndex
DROP INDEX "attacks_characterId_key";

-- DropIndex
DROP INDEX "characters_userId_key";

-- DropIndex
DROP INDEX "user_auth_userId_username_key";

-- AlterTable
ALTER TABLE "attacks" DROP COLUMN "characterId",
ADD COLUMN     "character_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "characters" DROP COLUMN "userId",
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "user_auth" DROP COLUMN "userId",
ADD COLUMN     "user_id" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "attacks_character_id_key" ON "attacks"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "characters_user_id_key" ON "characters"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_auth_user_id_username_key" ON "user_auth"("user_id", "username");

-- AddForeignKey
ALTER TABLE "user_auth" ADD CONSTRAINT "user_auth_user_id_username_fkey" FOREIGN KEY ("user_id", "username") REFERENCES "users"("id", "username") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "characters" ADD CONSTRAINT "characters_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attacks" ADD CONSTRAINT "attacks_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "characters"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
