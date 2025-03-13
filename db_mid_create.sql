CREATE TABLE Clients (
    ClientID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

CREATE TABLE Roles (
    RoleID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RoleID INT REFERENCES Roles(RoleID),
    DepartmentID INT REFERENCES Departments(DepartmentID),
    HireDate DATE DEFAULT CURRENT_DATE
);


CREATE TABLE Projects (
    ProjectID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    ClientID INT REFERENCES Clients(ClientID),
    ManagerID INT REFERENCES Users(UserID),
    Status VARCHAR(20) CHECK (Status IN ('Active', 'On Hold', 'Completed'))
);

CREATE TABLE Tasks (
    TaskID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Deadline DATE,
    AssignedTo INT REFERENCES Users(UserID),
    Status VARCHAR(20) DEFAULT 'Pending',
    Priority VARCHAR(20) CHECK (Priority IN ('High', 'Medium', 'Low'))
);

CREATE TABLE ProjectTeams (
    ProjectID INT REFERENCES Projects(ProjectID),
    UserID INT REFERENCES Users(UserID),
    RoleInProject VARCHAR(50),
    PRIMARY KEY (ProjectID, UserID)
);

CREATE TABLE TaskDependencies (
    TaskID INT REFERENCES Tasks(TaskID),
    DependentTaskID INT REFERENCES Tasks(TaskID),
    PRIMARY KEY (TaskID, DependentTaskID)
);

CREATE TABLE Milestones (
    MilestoneID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    Name VARCHAR(100) NOT NULL,
    DueDate DATE,
    Status VARCHAR(20) DEFAULT 'Planned'
);

CREATE TABLE Comments (
    CommentID SERIAL PRIMARY KEY,
    TaskID INT REFERENCES Tasks(TaskID),
    UserID INT REFERENCES Users(UserID),
    Text TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Budgets (
    BudgetID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    Amount DECIMAL(15,2) NOT NULL,
    ApprovedBy INT REFERENCES Users(UserID),
    ApprovedDate DATE
);

CREATE TABLE Expenses (
    ExpenseID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    Amount DECIMAL(15,2) NOT NULL,
    Description TEXT,
    DateIncurred DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Resources (
    ResourceID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50) CHECK (Type IN ('Human', 'Material', 'Equipment'))
);

CREATE TABLE ResourceAllocations (
    AllocationID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    ResourceID INT REFERENCES Resources(ResourceID),
    Quantity INT,
    AllocatedDate DATE
);

CREATE TABLE TimeLogs (
    LogID SERIAL PRIMARY KEY,
    TaskID INT REFERENCES Tasks(TaskID),
    UserID INT REFERENCES Users(UserID),
    StartTime TIMESTAMP,
    EndTime TIMESTAMP,
    Duration INTERVAL
);

CREATE TABLE ProgressReports (
    ReportID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    ReportDate DATE DEFAULT CURRENT_DATE,
    Summary TEXT,
    Status VARCHAR(20)
);

CREATE TABLE Risks (
    RiskID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    Description TEXT,
    Probability VARCHAR(20),
    Impact VARCHAR(20)
);

CREATE TABLE Issues (
    IssueID SERIAL PRIMARY KEY,
    ProjectID INT REFERENCES Projects(ProjectID),
    Title VARCHAR(100),
    Status VARCHAR(20) DEFAULT 'Open',
    ReportedBy INT REFERENCES Users(UserID)
);

CREATE INDEX idx_task_status ON Tasks(Status);
CREATE INDEX idx_project_client ON Projects(ClientID);


