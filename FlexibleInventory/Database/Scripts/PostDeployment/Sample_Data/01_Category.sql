IF NOT EXISTS (
    SELECT 1 FROM FlexibleInventory.Category
    WHERE Code = N'electronics'
)
BEGIN
    INSERT INTO FlexibleInventory.Category
        (Category_ID, Name, Description, Code)
    VALUES
        ('11111111-1111-1111-1111-111111111111',
         N'Electronics', N'Electronic products', N'electronics');
END;