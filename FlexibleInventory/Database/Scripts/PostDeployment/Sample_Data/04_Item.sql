IF NOT EXISTS (
    SELECT 1 FROM FlexibleInventory.Item
    WHERE Code = N'laptop-001'
)
BEGIN
    INSERT INTO FlexibleInventory.Item
        (Item_ID, Category_ID, Name, Description, Code)
    SELECT 
        '33333333-3333-3333-3333-333333333333',
        c.Category_ID, N'Laptop 001',
        N'High-performance laptop',
        N'laptop-001'
    FROM FlexibleInventory.Category AS c
        WHERE c.Code = N'electronics';
END;

