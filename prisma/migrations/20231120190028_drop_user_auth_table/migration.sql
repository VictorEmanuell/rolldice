/*
  Warnings:

  - You are about to drop the `user_auth` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "user_auth" DROP CONSTRAINT "user_auth_user_id_email_fkey";

-- DropTable
DROP TABLE "user_auth";
