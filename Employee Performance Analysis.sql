CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    DepartmentID INT,
    RegionID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE CustomerFeedback (
    FeedbackID INT PRIMARY KEY,
    EmployeeID INT,
    SaleID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FeedbackDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

CREATE TABLE PerformanceMetrics (
    MetricID INT PRIMARY KEY,
    EmployeeID INT,
    MetricName VARCHAR(50),
    MetricValue DECIMAL(10, 2),
    CalculationDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Role, DepartmentID, RegionID, HireDate) VALUES
(1, 'Amit', 'Sharma', 'Sales Manager', 1, 1, '2021-03-15'),
(2, 'Priya', 'Verma', 'Sales Executive', 1, 2, '2022-05-21'),
(3, 'Rohit', 'Singh', 'Sales Executive', 1, 3, '2021-07-10'),
(4, 'Neha', 'Gupta', 'Sales Executive', 1, 4, '2020-11-05'),
(5, 'Suresh', 'Patel', 'Sales Manager', 1, 2, '2019-04-22'),
(6, 'Anjali', 'Mehta', 'Sales Executive', 1, 1, '2023-01-30'),
(7, 'Vikas', 'Kumar', 'Sales Executive', 1, 3, '2020-02-14'),
(8, 'Divya', 'Rao', 'Sales Executive', 1, 4, '2021-06-18'),
(9, 'Ravi', 'Desai', 'Sales Manager', 1, 2, '2018-08-09'),
(10, 'Manish', 'Joshi', 'Sales Executive', 1, 1, '2022-12-02');

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales');

INSERT INTO Regions (RegionID, RegionName) VALUES
(1, 'North'),
(2, 'South'),
(3, 'East'),
(4, 'West');

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 55000.00),
(2, 'Smartphone', 'Electronics', 15000.00),
(3, 'Tablet', 'Electronics', 25000.00),
(4, 'Headphones', 'Accessories', 2000.00),
(5, 'Charger', 'Accessories', 500.00),
(6, 'Smartwatch', 'Wearables', 8000.00);

INSERT INTO Sales (SaleID, EmployeeID, ProductID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-06-10', 55000.00),
(2, 2, 2, '2023-07-12', 15000.00),
(3, 3, 3, '2023-08-15', 25000.00),
(4, 4, 4, '2023-09-17', 2000.00),
(5, 5, 5, '2023-10-01', 500.00),
(6, 6, 6, '2023-06-30', 8000.00),
(7, 7, 1, '2023-08-21', 55000.00),
(8, 8, 2, '2023-09-10', 15000.00),
(9, 9, 3, '2023-11-18', 25000.00),
(10, 10, 4, '2023-07-07', 2000.00),
(11, 1, 5, '2023-08-25', 500.00),
(12, 2, 6, '2023-09-13', 8000.00);


INSERT INTO CustomerFeedback (FeedbackID, EmployeeID, SaleID, Rating, Comments, FeedbackDate) VALUES
(1, 1, 1, 5, 'Excellent service!', '2023-06-12'),
(2, 2, 2, 4, 'Good product quality.', '2023-07-14'),
(3, 3, 3, 3, 'Satisfactory.', '2023-08-17'),
(4, 4, 4, 5, 'Quick and efficient.', '2023-09-19'),
(5, 5, 5, 4, 'Product was as described.', '2023-10-03'),
(6, 6, 6, 2, 'Could be better.', '2023-07-02'),
(7, 7, 7, 5, 'Highly recommend.', '2023-08-23'),
(8, 8, 8, 3, 'Okay experience.', '2023-09-12'),
(9, 9, 9, 5, 'Great experience.', '2023-11-20'),
(10, 10, 10, 4, 'Satisfied with the purchase.', '2023-07-09');


INSERT INTO PerformanceMetrics (MetricID, EmployeeID, MetricName, MetricValue, CalculationDate) VALUES
(1, 1, 'Total Sales', 55500.00, '2023-06-30'),
(2, 2, 'Total Sales', 23000.00, '2023-07-31'),
(3, 3, 'Total Sales', 25000.00, '2023-08-31'),
(4, 4, 'Total Sales', 2000.00, '2023-09-30'),
(5, 5, 'Total Sales', 500.00, '2023-10-31'),
(6, 6, 'Total Sales', 16000.00, '2023-06-30'),
(7, 7, 'Total Sales', 55000.00, '2023-08-31'),
(8, 8, 'Total Sales', 15000.00, '2023-09-30'),
(9, 9, 'Total Sales', 25000.00, '2023-11-30'),
(10, 10, 'Total Sales', 2000.00, '2023-07-31');

-- Total Sales by Each Employee
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Employees e
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    TotalSales DESC;

-- Avg customer Rating by Employee
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    round(AVG(f.Rating),0) AS AverageRating
FROM 
    Employees e
JOIN 
    CustomerFeedback f ON e.EmployeeID = f.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    AverageRating DESC;
	
-- Sales by Region
SELECT 
    r.RegionName, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Regions r
JOIN 
    Employees e ON r.RegionID = e.RegionID
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY 
    r.RegionName
ORDER BY 
    TotalSales DESC;

-- Top 5 Employees by total Sales
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Employees e
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    TotalSales DESC
LIMIT 5;


-- Sales Count and total sales by product
SELECT 
    p.ProductName, 
    COUNT(s.SaleID) AS SalesCount, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Products p
JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    SalesCount DESC, TotalSales DESC;

-- Employees with Sales Exceeding 50,000
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Employees e
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
HAVING 
    SUM(s.SaleAmount) > 50000
ORDER BY 
    TotalSales DESC;
	
-- Average Sales Per Employee by Region
SELECT 
    r.RegionName, 
    round(AVG(TotalSales),0) AS AvgSalesPerEmployee
FROM (
    SELECT 
        e.RegionID, 
        SUM(s.SaleAmount) AS TotalSales
    FROM 
        Employees e
    JOIN 
        Sales s ON e.EmployeeID = s.EmployeeID
    GROUP BY 
        e.EmployeeID, e.RegionID
) AS EmployeeSales
JOIN 
    Regions r ON EmployeeSales.RegionID = r.RegionID
GROUP BY 
    r.RegionName
ORDER BY 
    AvgSalesPerEmployee DESC;

-- Customer Feedback Summary by Employee
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    COUNT(f.FeedbackID) AS TotalFeedbacks, 
    round(AVG(f.Rating),0) AS AverageRating
FROM 
    Employees e
JOIN 
    CustomerFeedback f ON e.EmployeeID = f.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    TotalFeedbacks DESC;
	
-- Top 3 Products by Sales Amount
SELECT 
    p.ProductName, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Products p
JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    TotalSales DESC
LIMIT 3;

-- Employee Performance by Department
SELECT 
    d.DepartmentName, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    SUM(s.SaleAmount) AS TotalSales, 
    round(AVG(f.Rating),0) AS AverageRating
FROM 
    Departments d
JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
JOIN 
    CustomerFeedback f ON e.EmployeeID = f.EmployeeID
GROUP BY 
    d.DepartmentName, e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    TotalSales DESC, AverageRating DESC;


-- Monthly Sales Trend for Each Employee
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    EXTRACT(YEAR FROM s.SaleDate) AS Year, 
    EXTRACT(MONTH FROM s.SaleDate) AS Month, 
    SUM(s.SaleAmount) AS TotalSales
FROM 
    Employees e
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName, Year, Month
ORDER BY 
    Year, Month, TotalSales DESC;
	
-- Employee Retention Analysis
SELECT 
    EXTRACT(YEAR FROM HireDate) AS HireYear, 
    COUNT(EmployeeID) AS Hires
FROM 
    Employees
GROUP BY 
    HireYear
ORDER BY
    HireYear DESC;
	
-- Sales Commands by Category
SELECT 
    p.Category, 
    SUM(s.SaleAmount) AS TotalSales, 
    COUNT(s.SaleID) AS TotalSalesCount
FROM 
    Products p
JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.Category
ORDER BY 
    TotalSales DESC;
	
-- Employees with No Sales in the Last 3 Months
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM 
    Employees e
LEFT JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID AND s.SaleDate > CURRENT_DATE - INTERVAL '3 months'
WHERE 
    s.SaleID IS NULL;

-- Employees with highest customer satisfaction
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    round(AVG(f.Rating),0) AS AvgRating
FROM 
    Employees e
JOIN 
    CustomerFeedback f ON e.EmployeeID = f.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
HAVING 
    AVG(f.Rating) = 5
ORDER BY 
    AvgRating DESC;
	
	
-- Correlation Between Sales and Feedback ratings
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    SUM(s.SaleAmount) AS TotalSales, 
    round(AVG(f.Rating),0) AS AvgRating
FROM 
    Employees e
JOIN 
    Sales s ON e.EmployeeID = s.EmployeeID
JOIN 
    CustomerFeedback f ON e.EmployeeID = f.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    TotalSales DESC, AvgRating DESC;





	




