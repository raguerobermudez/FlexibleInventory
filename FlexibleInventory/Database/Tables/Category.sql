CREATE Table FlexibleInventory.Category
(
    Category_ID UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Category_Code UNIQUE (Code)
);