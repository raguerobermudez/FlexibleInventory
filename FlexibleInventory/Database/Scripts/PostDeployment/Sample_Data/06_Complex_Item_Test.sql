SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @CategoryId UNIQUEIDENTIFIER;
    DECLARE @ItemId UNIQUEIDENTIFIER;

    SELECT @CategoryId = Category_ID
    FROM FlexibleInventory.Category
    WHERE Code = N'electronics';

    SELECT @ItemId = Item_ID
    FROM FlexibleInventory.Item
    WHERE Code = N'laptop-001';

    IF @CategoryId IS NULL OR @ItemId IS NULL
        THROW 51000, 'No se encontró la categoría o la entidad de prueba.', 1;

    IF NOT EXISTS (
        SELECT 1 FROM FlexibleInventory.Attribute WHERE Code = N'memory'
    )
        INSERT INTO FlexibleInventory.Attribute
            (Attribute_ID, Name, Description, Code, Data_Type)
        VALUES
            (NEWID(), N'Memory', N'Installed memory', N'memory', N'string');

    IF NOT EXISTS (
        SELECT 1 FROM FlexibleInventory.Attribute WHERE Code = N'storage'
    )
        INSERT INTO FlexibleInventory.Attribute
            (Attribute_ID, Name, Description, Code, Data_Type)
        VALUES
            (NEWID(), N'Storage', N'Storage capacity', N'storage', N'string');

    INSERT INTO FlexibleInventory.Category_Attribute
        (Category_ID, Attribute_ID, Is_Required, Default_Value)
    SELECT @CategoryId, a.Attribute_ID, 0, NULL
    FROM FlexibleInventory.Attribute AS a
    WHERE a.Code IN (N'memory', N'storage')
      AND NOT EXISTS (
          SELECT 1
          FROM FlexibleInventory.Category_Attribute AS ca
          WHERE ca.Category_ID = @CategoryId
            AND ca.Attribute_ID = a.Attribute_ID
      );

    INSERT INTO FlexibleInventory.Item_Attribute_Value
        (Item_ID, Attribute_ID, Category_ID, Val)
    SELECT
        @ItemId,
        a.Attribute_ID,
        @CategoryId,
        CASE a.Code
            WHEN N'memory' THEN N'16 GB'
            WHEN N'storage' THEN N'512 GB'
        END
    FROM FlexibleInventory.Attribute AS a
    JOIN FlexibleInventory.Category_Attribute AS ca
      ON ca.Category_ID = @CategoryId
     AND ca.Attribute_ID = a.Attribute_ID
    WHERE a.Code IN (N'memory', N'storage')
      AND NOT EXISTS (
          SELECT 1
          FROM FlexibleInventory.Item_Attribute_Value AS ev
          WHERE ev.Item_ID = @ItemId
            AND ev.Attribute_ID = a.Attribute_ID
      );

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    THROW;
END CATCH;