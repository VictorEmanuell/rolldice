-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_auth" (
    "userId" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "character" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "level" INTEGER NOT NULL,

    CONSTRAINT "character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attributes" (
    "characterId" TEXT NOT NULL,
    "strength" INTEGER NOT NULL,
    "dexterity" INTEGER NOT NULL,
    "constitution" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "wisdom" INTEGER NOT NULL,
    "charisma" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "attack" (
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

-- CreateIndex
CREATE UNIQUE INDEX "user_id_username_key" ON "user"("id", "username");

-- CreateIndex
CREATE UNIQUE INDEX "user_auth_userId_username_key" ON "user_auth"("userId", "username");

-- CreateIndex
CREATE UNIQUE INDEX "character_userId_key" ON "character"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "attributes_characterId_key" ON "attributes"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "attack_characterId_key" ON "attack"("characterId");

-- AddForeignKey
ALTER TABLE "user_auth" ADD CONSTRAINT "user_auth_userId_username_fkey" FOREIGN KEY ("userId", "username") REFERENCES "user"("id", "username") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attack" ADD CONSTRAINT "attack_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
