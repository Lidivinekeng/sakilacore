-- Use the newly created database
USE bookcore;

-- Create the User table
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Create the Author table
CREATE TABLE Author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL
);

-- Create the Book table
CREATE TABLE Book (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- Create the UserFavoriteBooks joiner table
CREATE TABLE UserFavoriteBooks (
    UserID INT,
    BookID INT,
    PRIMARY KEY (UserID, BookID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);
-- Insert data into the User table
INSERT INTO User (FirstName, LastName, Email)
VALUES
    ('John', 'Doe', 'JD@books.com'),
    ('Robin', 'Smith', 'Robin@books.com'),
    ('Gloria', 'Rodriguez', 'grodriguez@books.com');

-- Insert data into the Author table (assuming AuthorName is unique)
INSERT INTO Author (AuthorName)
VALUES
    ('Stephen King'),
    ('F. Scott Fitzgerald'),
    ('Jack London'),
    ('Jane Austen'),
    ('Mary Shelley');
-- Sample relationships between users and favorite authors
-- John's favorite author is Stephen King
-- Robin's favorite author is Jack London
-- Gloria's favorite author is Jane Austen
UPDATE User
SET FavoriteAuthorID = 1  -- Stephen King
WHERE FirstName = 'John';

UPDATE User
SET FavoriteAuthorID = 3  -- Jack London
WHERE FirstName = 'Robin';

UPDATE User
SET FavoriteAuthorID = 4  -- Jane Austen
WHERE FirstName = 'Gloria';

