IF NOT EXISTS (
    SELECT 1 FROM FlexibleInventory.Attribute
    WHERE Code = N'color'
)
BEGIN
    INSERT INTO FlexibleInventory.Attribute
        (Attribute_ID, Name, Description, Code, Data_Type)
    VALUES
        ('22222222-2222-2222-2222-222222222222',
         N'Color', N'Color of the product', N'color', N'string');
END;