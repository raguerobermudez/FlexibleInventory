IF NOT EXISTS (
    SELECT 1
    FROM FlexibleInventory.Category_Attribute as CA
    JOIN FlexibleInventory.Category as C
     ON c.Category_ID = ca.Category_ID
    JOIN FlexibleInventory.Attribute as A
     ON a.Attribute_ID = ca.Attribute_ID
    WHERE c.Code = N'electronics' and a.Code = N'color'
)
BEGIN
    INSERT INTO FlexibleInventory.Category_Attribute
        (Category_ID, Attribute_ID, Is_Required, Default_Value)
    SELECT c.Category_ID, a.Attribute_ID, 0, NULL
    FROM FlexibleInventory.Category as C
    CROSS JOIN FlexibleInventory.Attribute as A
    WHERE c.Code = N'electronics' and a.Code = N'color'
END;