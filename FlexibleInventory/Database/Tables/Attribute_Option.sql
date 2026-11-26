CREATE Table FlexibleInventory.Attribute_Option
(
    Attribute_ID UNIQUEIDENTIFIER NOT NULL,
    val NVARCHAR(100) NOT NULL,
    Label NVARCHAR(255) NOT NULL,
    PRIMARY KEY (Attribute_ID, val),
    Foreign Key (Attribute_ID) REFERENCES FlexibleInventory.Attribute(Attribute_ID)
);
