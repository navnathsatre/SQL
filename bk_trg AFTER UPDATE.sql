CREATE DEFINER=`root`@`localhost` TRIGGER `bk_trg` AFTER UPDATE ON `books` FOR EACH ROW BEGIN
     insert into book_sales (bookid, tittle, qty_sold, tos)
     values(old.bookid, old.title, new.sales - old.sales, now());
     
END