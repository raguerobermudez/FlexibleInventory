CREATE Table FlexibleInventory.Entity
(
    Entity_ID UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Category_ID UNIQUEIDENTIFIER NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Created_At DATETIME NOT NULL DEFAULT GETDATE(),
    Updated_At DATETIME NOT NULL DEFAULT GETDATE(),
    Description NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NOT NULL,
    Foreign Key (Category_ID) REFERENCES FlexibleInventory.Category(Category_ID),
    CONSTRAINT UQ_Entity_Code UNIQUE (Code),
    CONSTRAINT UQ_Entity_ID_Category_ID UNIQUE (Entity_ID, Category_ID)
)