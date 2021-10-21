use fancy_company;
CREATE VIEW INVOICE_VIEW
AS 
SELECT I.Invoice_ID AS 'Invoice Number', I.Created_At as 'Date of issue', concat(U.User_First_Name,' ', U.User_Last_Name) as 'Client Name', UA.User_Address_Streetname AS 'Street Address', UA.User_Address_City as 'City', UA.User_Address_Postalcode as 'Postal Code', UA.User_Adress_Country as 'Country', I.Sales_Amount AS 'Subtotal', (I.Sales_Amount*0.19)  AS 'Tax', (I.Sales_Amount*1.19) - (I.Sales_Amount*1.19* (D.Discount_Percentage/100)) as 'Total', D.Discount_Percentage AS 'Discount %'
FROM invoice AS I, ORDERS AS O, user AS U, user_address AS UA, discount AS D
WHERE I.Order_ID = O.Order_ID AND U.User_ID = O.Order_ID AND U.User_ID = UA.User_ID AND O.Discount_ID = O.Discount_ID;

SELECT * FROM INVOICE_VIEW




