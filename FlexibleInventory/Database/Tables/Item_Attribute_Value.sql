Create Table FlexibleInventory.Item_Attribute_Value
(
    Item_ID UNIQUEIDENTIFIER NOT NULL,
    Attribute_ID UNIQUEIDENTIFIER NOT NULL,
    Category_ID UNIQUEIDENTIFIER NOT NULL,
    Val NVARCHAR(255) NOT NULL,
    PRIMARY KEY (Item_ID, Attribute_ID),
    FOREIGN KEY (Item_ID, Category_ID)
        REFERENCES FlexibleInventory.Item (Item_ID, Category_ID),
    FOREIGN KEY (Category_ID, Attribute_ID)
        REFERENCES FlexibleInventory.Category_Attribute (Category_ID, Attribute_ID)
);