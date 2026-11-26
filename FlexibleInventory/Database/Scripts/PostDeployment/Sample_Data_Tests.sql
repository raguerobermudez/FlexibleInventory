SELECT
    DB_NAME() AS CurrentDatabase,
    c.Code AS CategoryCode,
    i.Code AS ItemCode,
    a.Code AS AttributeCode,
    a.Name AS AttributeName,
    iav.Val
FROM FlexibleInventory.Item_Attribute_Value AS iav
JOIN FlexibleInventory.Item AS i
  ON i.Item_ID = iav.Item_ID
JOIN FlexibleInventory.Category AS c
  ON c.Category_ID = iav.Category_ID
JOIN FlexibleInventory.Attribute AS a
  ON a.Attribute_ID = iav.Attribute_ID
WHERE i.Code = N'laptop-001'
ORDER BY a.Code;