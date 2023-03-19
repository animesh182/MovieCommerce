-- CreateEnum
CREATE TYPE "Status" AS ENUM ('INITIATED', 'PROCESSED', 'SHIPPED', 'COLLECTED');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('CUSTOMER', 'ADMIN');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'CUSTOMER',
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "status" "Status" NOT NULL DEFAULT 'INITIATED',
    "initited" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderHistory" (
    "id" SERIAL NOT NULL,
    "received" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "OrderHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cart" (
    "id" SERIAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "checkout" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Cart_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Movie" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "genre" TEXT NOT NULL,
    "Year" TIMESTAMP(3) NOT NULL,
    "Lead" TEXT,
    "Director" TEXT,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_OrderToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_OrderToOrderHistory" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_OrderHistoryToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CartToMovie" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CartToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CartToOrder" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_OrderToUser_AB_unique" ON "_OrderToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_OrderToUser_B_index" ON "_OrderToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_OrderToOrderHistory_AB_unique" ON "_OrderToOrderHistory"("A", "B");

-- CreateIndex
CREATE INDEX "_OrderToOrderHistory_B_index" ON "_OrderToOrderHistory"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_OrderHistoryToUser_AB_unique" ON "_OrderHistoryToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_OrderHistoryToUser_B_index" ON "_OrderHistoryToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CartToMovie_AB_unique" ON "_CartToMovie"("A", "B");

-- CreateIndex
CREATE INDEX "_CartToMovie_B_index" ON "_CartToMovie"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CartToUser_AB_unique" ON "_CartToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_CartToUser_B_index" ON "_CartToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CartToOrder_AB_unique" ON "_CartToOrder"("A", "B");

-- CreateIndex
CREATE INDEX "_CartToOrder_B_index" ON "_CartToOrder"("B");

-- AddForeignKey
ALTER TABLE "_OrderToUser" ADD CONSTRAINT "_OrderToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderToUser" ADD CONSTRAINT "_OrderToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderToOrderHistory" ADD CONSTRAINT "_OrderToOrderHistory_A_fkey" FOREIGN KEY ("A") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderToOrderHistory" ADD CONSTRAINT "_OrderToOrderHistory_B_fkey" FOREIGN KEY ("B") REFERENCES "OrderHistory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderHistoryToUser" ADD CONSTRAINT "_OrderHistoryToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "OrderHistory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OrderHistoryToUser" ADD CONSTRAINT "_OrderHistoryToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartToMovie" ADD CONSTRAINT "_CartToMovie_A_fkey" FOREIGN KEY ("A") REFERENCES "Cart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartToMovie" ADD CONSTRAINT "_CartToMovie_B_fkey" FOREIGN KEY ("B") REFERENCES "Movie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartToUser" ADD CONSTRAINT "_CartToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Cart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartToUser" ADD CONSTRAINT "_CartToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartToOrder" ADD CONSTRAINT "_CartToOrder_A_fkey" FOREIGN KEY ("A") REFERENCES "Cart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CartToOrder" ADD CONSTRAINT "_CartToOrder_B_fkey" FOREIGN KEY ("B") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;
