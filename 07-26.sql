SELECT * FROM employees;

SeLEcT LastName
FroM emploYees;

SELECT 
    firstName, 
    lastName, 
    jobTitle
FROM
    employees;
    
SELECT 1 * 11; 

SELECT NOW();
SELECT curdate();
SELECT curtime();

SELECT NOW(), curdate(), curtime();

SELECT CONCAT('John',' ','Doe');

SELECT CONCAT('John',' ','Doe')
FROM DUAL;

SELECT CONCAT('John',' ','Doe') AS name;
SELECT CONCAT('John',' ','Doe') name;

SELECT NOW() now, curdate() today, curtime() as time;


SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname;
    
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname,
	contactFirstname;
    
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;
    
SELECT 
    contactLastname, 
    contactFirstname
FROM
    customers
ORDER BY 
	contactLastname DESC , 
	contactFirstname ASC;
    
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
   
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;

SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY 3 DESC;

SELECT FIELD('A', 'A', 'B','C');
SELECT FIELD('C', 'A', 'B','C');
SELeCT FiELD('B', 'A', 'B','C');
SELECT FIELD('b', 'A', 'B','C');

SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');
        
SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo;

SELECT 
    firstName, lastName, reportsTo
FROM
    employees
Where reportsTo is not null
ORDER BY reportsTo;

SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
    
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
    
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1;
    

SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 3 AND 1
ORDER BY officeCode;

SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1,2,3)
ORDER BY officeCode;

SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode = 1 or 2 or 3
ORDER BY officeCode;
/* BETWEEN 1 AND 3 === IN (1,2,3) === 1 or 2 or 3 */

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '_____son'
ORDER BY firstName;

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '______son'
ORDER BY firstName;

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%s%'
ORDER BY firstName;


SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
    

SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;
    
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;
    
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
    
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;
    
SELECT DISTINCT state
FROM customers;

SELECT count(*)
FROM customers
where state is null;

SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
    
SELECT 
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state , 
    city;
    
SELECT 1 AND 1;

SELECT 1 AND 0;

SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;

SELECT 1 = 0 AND 1 / 0 ;

SELECT 1 / 0;

SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND
    state = 'CA';
    
SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    (country = 'USA' AND 
    state = 'CA') OR 
    creditlimit > 100000;

SELECT 1 IN (1,2,3);

SELECT 4 IN (1,2,3);

SELECT NULL IN (1,2,3);

SELECT 0 IN (1 , 2, 3, NULL);

SELECT 4 IN (1 , 2, 3, NULL);

SELECT null IN (1 , 2, 3, NULL);

SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');


SELECT 1 NOT IN (1,2,3);

SELECT 0 NOT IN (1,2,3);

SELECT NULL NOT IN (1,2,3);

SELECT NULL NOT IN (1,2,3, null);

SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city;

SELECT 15 BETWEEN 10 AND 20;
SELECT 15.25 BETWEEN 10 AND 20;
SELECT 15 BETWEEN 20 AND 30;

SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;
    
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
    
select now()

SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);
     
SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     '2003-01-13' AND 
     '2003-01-18';
     
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%';
     
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';
    
SELECT 
    productCode, 
    productName
FROM
    products;
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';
    
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';