IF NOT EXISTS (
    SELECT 1
    FROM FlexibleInventory.Item_Attribute_Value AS ev
    JOIN FlexibleInventory.Item AS e
      ON e.Item_ID = ev.Item_ID
    JOIN FlexibleInventory.Attribute AS a
      ON a.Attribute_ID = ev.Attribute_ID
    WHERE e.Code = N'laptop-001'
      AND a.Code = N'color'
)
BEGIN
    INSERT INTO FlexibleInventory.Item_Attribute_Value
        (Item_ID, Attribute_ID, Category_ID, Val)
    SELECT e.Item_ID, a.Attribute_ID, e.Category_ID, N'Silver'
    FROM FlexibleInventory.Item AS e
    JOIN FlexibleInventory.Category_Attribute AS ca
      ON ca.Category_ID = e.Category_ID
    JOIN FlexibleInventory.Attribute AS a
      ON a.Attribute_ID = ca.Attribute_ID
    WHERE e.Code = N'laptop-001'
      AND a.Code = N'color';
END;