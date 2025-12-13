

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
   DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
    SET @batch_start_time = GETDATE();
    PRINT '===================================================';
    PRINT 'Loading Bronze Layer';
    PRINT '===================================================';

    PRINT '---------------------------------------------------';
    PRINT 'Loading CRM Tables';
    PRINT '---------------------------------------------------';

    SET @start_time = GETDATE();
        PRINT '>> Truncating Table:bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
   
        PRINT '>> Inserting Data Into:bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
    
        FROM 'C:\Users\dell\OneDrive\Documents\DATASETS\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT  '>>Load Duration:' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + 'seconds';
       PRINT '>>-----------------------------';
       
       SET @start_time = GETDATE();
       PRINT '>> Truncating Table:bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
    
        PRINT '>> Inserting Data Into:bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\dell\OneDrive\Documents\DATASETS\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT  '>>Load Duration:' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + 'seconds';
       PRINT '>>-----------------------------';

       SET @start_time = GETDATE();
        PRINT '>> Truncating Table:bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT '>> Inserting Data Into:bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
    
        FROM 'C:\Users\dell\OneDrive\Documents\DATASETS\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT  '>>Load Duration:' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + 'seconds';
       PRINT '>>-----------------------------';


    PRINT '---------------------------------------------------';
    PRINT 'Loading ERP Tables';
    PRINT '---------------------------------------------------';

    SET @start_time = GETDATE();
    PRINT '>> Truncating Table:bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        PRINT '>> Inserting Data Into:bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\dell\OneDrive\Documents\DATASETS\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT  '>>Load Duration:' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + 'seconds';
       PRINT '>>-----------------------------';
        
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table:bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        
        PRINT '>> Inserting Data Into:bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\dell\OneDrive\Documents\DATASETS\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
         SET @end_time = GETDATE();
        PRINT  '>>Load Duration:' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + 'seconds';
       PRINT '>>-----------------------------';
       
       SET @start_time = GETDATE();
       PRINT '>> Truncating Table:bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        PRINT '>> Inserting Data Into:bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
    
        FROM 'C:\Users\dell\OneDrive\Documents\DATASETS\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT  '>>Load Duration:' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + 'seconds';
       PRINT '>>-----------------------------';

       SET @batch_end_time = GETDATE();
       PRINT '================================================';
       PRINT 'Loading Bronze Layer is complete';
       PRINT '    -Total Duration:' +CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
       PRINT '================================================';

    END 
       GO
       EXEC bronze.load_bronze
    BEGIN CATCH
    PRINT '===================================';
    END CATCH
END
