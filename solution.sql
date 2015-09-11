Which authors are represented in our store?

—SELECT * FROM authors;

Which authors are also distinguished authors?

—SELECT * FROM distingushed_authors;

Which authors are not distinguished authors?

—SELECT * FROM authors LEFT JOIN distinguished_authors ON authors.id = distinguished_authors.id WHERE distinguished_authors.award IS NULL;

How many authors are represented in our store?

—SELECT COUNT (id) FROM authors

Who are the favorite authors of the employee with the first name of Michael?

—SELECT authors_and_titles FROM favorite_authors RIGHT JOIN employees ON favorite_authors.employee_id = employees.id WHERE employees.first_name LIKE 'Michael';

What are the titles of all the books that are in stock today?

—SELECT books.title FROM books JOIN editions ON books.id = editions.book_id JOIN daily_inventory ON editions.isbn = daily_inventory.isbn WHERE daily_inventory.is_stocked IS true;

Insert one of your favorite books into the database. Hint: You’ll want to create data into at least 2 other tables to completely create this book.

— INSERT INTO authors (id, first_name, last_name) VALUES (0001, 'Tom', 'Clancy');

INSERT INTO books (id, title, author_id, subject_id) VALUES (8765, 'Rainbow Six', 0001, 9999);

INSERT INTO editions (isbn, book_id, edition, publisher_id, publication) VALUES (4567, 8765, 1, 6789, current_date);

What authors have books that are not in stock?

—SELECT first_name, last_name FROM authors JOIN books ON authors.id = books.author_id JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn AND stock.stock = 0;

What is the title of the book that has the most stock?

—SELECT title FROM books JOIN editions ON books.id = editions.book_id JOIN stock ON editions.isbn = stock.isbn ORDER BY stock.stock DESC LIMIT 1;
