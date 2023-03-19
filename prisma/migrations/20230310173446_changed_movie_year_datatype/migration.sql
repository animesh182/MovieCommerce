/*
  Warnings:

  - Added the required column `quantity` to the `Movie` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Movie" ADD COLUMN     "quantity" INTEGER NOT NULL,
ALTER COLUMN "Year" SET DATA TYPE DATE;
