CREATE Table FlexibleInventory.Category_Attribute
(
    Category_ID UNIQUEIDENTIFIER NOT NULL,
    Attribute_ID UNIQUEIDENTIFIER NOT NULL,
    Is_Required BIT NOT NULL,
    Default_Value NVARCHAR(255) NULL,
    PRIMARY KEY (Category_ID, Attribute_ID),
    Foreign Key (Category_ID) REFERENCES FlexibleInventory.Category(Category_ID),
    Foreign Key (Attribute_ID) REFERENCES FlexibleInventory.Attribute(Attribute_ID)
);