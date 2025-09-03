/*
  Warnings:

  - You are about to drop the column `usuarioid` on the `telefone` table. All the data in the column will be lost.
  - Added the required column `usuarioId` to the `Telefone` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `telefone` DROP FOREIGN KEY `Telefone_usuarioid_fkey`;

-- DropIndex
DROP INDEX `Telefone_usuarioid_fkey` ON `telefone`;

-- AlterTable
ALTER TABLE `telefone` DROP COLUMN `usuarioid`,
    ADD COLUMN `usuarioId` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Quarto` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `numero` VARCHAR(20) NOT NULL,
    `descricao` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NULL,
    `totalOspedes` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reserva` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `usuarioId` INTEGER NOT NULL,
    `quartoId` INTEGER NULL,
    `dataReserva` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dataEntradaPrevista` DATETIME(3) NOT NULL,
    `dataSaidaPrevista` DATETIME(3) NOT NULL,
    `dataEntrada` DATETIME(3) NULL,
    `dataSaida` DATETIME(3) NULL,
    `quantidadeOspedes` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Telefone` ADD CONSTRAINT `Telefone_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reserva` ADD CONSTRAINT `Reserva_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reserva` ADD CONSTRAINT `Reserva_quartoId_fkey` FOREIGN KEY (`quartoId`) REFERENCES `Quarto`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
