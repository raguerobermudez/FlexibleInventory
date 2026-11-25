Create Table FlexibleInventory.Entity_Value
(
    Entity_ID UNIQUEIDENTIFIER NOT NULL,
    Attribute_ID UNIQUEIDENTIFIER NOT NULL,
    Category_ID UNIQUEIDENTIFIER NOT NULL,
    Val NVARCHAR(255) NOT NULL,
    PRIMARY KEY (Entity_ID, Attribute_ID),
    FOREIGN KEY (Entity_ID, Category_ID)
        REFERENCES FlexibleInventory.Entity (Entity_ID, Category_ID),
    FOREIGN KEY (Category_ID, Attribute_ID)
        REFERENCES FlexibleInventory.Category_Attribute (Category_ID, Attribute_ID)
);