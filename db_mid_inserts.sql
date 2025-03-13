
INSERT INTO Clients (ClientID, CompanyName, ContactName, Email, Phone)
VALUES 
    (6, 'FutureTech', 'Emily White', 'emily.white@futuretech.com', '+4455667788'),
    (7, 'VisionaryAI', 'Michael Green', 'michael.green@visionaryai.com', '+5566778899'),
    (8, 'QuantumLeap', 'Sophia Black', 'sophia.black@quantumleap.com', '+6677889900'),
    (9, 'SkyNet Solutions', 'Daniel Blue', 'daniel.blue@skynetsolutions.com', '+7788990011'),
    (10, 'NextGen Systems', 'Olivia Gray', 'olivia.gray@nextgensystems.com', '+8899001122');

INSERT INTO Roles (RoleID, Name)
VALUES 
    (7, 'DevOps Engineer'),
    (8, 'Product Owner'),
    (9, 'Scrum Master'),
    (10, 'Data Scientist');

INSERT INTO Departments (DepartmentID, Name)
VALUES 
    (7, 'DevOps'),
    (8, 'Product Management'),
    (9, 'Data Science'),
    (10, 'Customer Support');

INSERT INTO Users (UserID, FullName, Email, RoleID, DepartmentID, HireDate)
VALUES 
    (11, 'DevOps Engineer', 'devops@example.com', 7, 7, '2022-11-01'),
    (12, 'Product Owner', 'productowner@example.com', 8, 8, '2022-12-01'),
    (13, 'Scrum Master', 'scrummaster@example.com', 9, 8, '2023-01-01'),
    (14, 'Data Scientist', 'datascientist@example.com', 10, 9, '2023-02-01'),
    (15, 'Support Specialist', 'support@example.com', 2, 10, '2023-03-01');

INSERT INTO Projects (ProjectID, Name, StartDate, EndDate, ClientID, ManagerID, Status)
VALUES 
    (6, 'AI Chatbot Development', '2023-06-01', '2023-12-31', 6, 12, 'Active'),
    (7, 'Blockchain Integration', '2023-07-01', '2024-01-31', 7, 12, 'On Hold'),
    (8, 'IoT Platform Setup', '2023-08-01', '2024-03-31', 8, 12, 'On Hold'),
    (9, 'Cybersecurity Audit', '2023-09-01', '2023-11-30', 9, 11, 'Completed'),
    (10, 'Customer Portal Redesign', '2023-10-01', '2024-02-28', 10, 15, 'Active');

INSERT INTO Tasks (TaskID, ProjectID, Title, Description, Deadline, AssignedTo, Status, Priority)
VALUES 
    (7, 6, 'Train AI Model', 'Train the chatbot model on historical data', '2023-10-15', 14, 'In Progress', 'High'),
    (8, 6, 'Integrate Chatbot API', 'Integrate chatbot with the website', '2023-11-01', 3, 'Pending', 'Medium'),
    (9, 7, 'Set Up Blockchain Nodes', 'Initialize blockchain nodes for testing', '2023-12-01', 11, 'Pending', 'Low'),
    (10, 8, 'Configure IoT Devices', 'Set up IoT devices for data collection', '2024-02-01', 13, 'Planned', 'High'),
    (11, 9, 'Conduct Security Tests', 'Perform penetration testing on systems', '2023-10-15', 4, 'Completed', 'High'),
    (12, 10, 'Redesign Login Page', 'Create a new login page for the portal', '2023-11-30', 6, 'In Progress', 'Medium');

INSERT INTO ProjectTeams (ProjectID, UserID, RoleInProject)
VALUES 
    (6, 12, 'Manager'),
    (6, 14, 'Data Scientist'),
    (7, 11, 'DevOps Engineer'),
    (8, 13, 'Scrum Master'),
    (9, 4, 'Tester'),
    (10, 6, 'Designer'),
    (6, 3, 'Developer'),
    (7, 7, 'Junior Developer'),
    (8, 8, 'Senior QA'),
    (9, 9, 'HR Manager');

INSERT INTO TaskDependencies (TaskID, DependentTaskID)
VALUES 
    (7, 8),
    (9, 10),
    (11, 12);

INSERT INTO Milestones (MilestoneID, ProjectID, Name, DueDate, Status)
VALUES 
    (6, 6, 'AI Model Training Complete', '2023-10-20', 'Planned'),
    (7, 7, 'Blockchain Node Setup', '2023-12-10', 'Planned'),
    (8, 8, 'IoT Device Configuration', '2024-02-15', 'Planned'),
    (9, 9, 'Security Testing Complete', '2023-10-20', 'Completed'),
    (10, 10, 'Login Page Redesign Complete', '2023-12-05', 'Planned');

INSERT INTO Comments (CommentID, TaskID, UserID, Text)
VALUES 
    (6, 7, 12, 'Ensure the AI model is trained on diverse datasets.'),
    (7, 8, 3, 'API integration documentation will be provided soon.'),
    (8, 9, 11, 'Need clarification on blockchain node setup.'),
    (9, 10, 13, 'IoT device configuration requires additional resources.'),
    (10, 11, 4, 'Security tests completed successfully.');

INSERT INTO Budgets (BudgetID, ProjectID, Amount, ApprovedBy, ApprovedDate)
VALUES 
    (6, 6, 200000.00, 1, '2023-06-05'),
    (7, 7, 150000.00, 1, '2023-07-10'),
    (8, 8, 250000.00, 1, '2023-08-15'),
    (9, 9, 100000.00, 1, '2023-09-01'),
    (10, 10, 180000.00, 1, '2023-10-05');

INSERT INTO Expenses (ExpenseID, ProjectID, Amount, Description, DateIncurred)
VALUES 
    (6, 6, 50000.00, 'AI model training costs', '2023-06-10'),
    (7, 7, 30000.00, 'Blockchain software licenses', '2023-07-15'),
    (8, 8, 40000.00, 'IoT device purchases', '2023-08-20'),
    (9, 9, 20000.00, 'Security testing tools', '2023-09-05'),
    (10, 10, 30000.00, 'Design software subscriptions', '2023-10-10');

INSERT INTO Resources (ResourceID, Name, Type)
VALUES 
    (6, 'TensorFlow License', 'Material'),
    (7, 'IoT Gateway', 'Equipment'),
    (8, 'Penetration Testing Tool', 'Material'),
    (9, 'Adobe XD License', 'Material'),
    (10, 'Blockchain Node Server', 'Equipment');

INSERT INTO ResourceAllocations (AllocationID, ProjectID, ResourceID, Quantity, AllocatedDate)
VALUES 
    (6, 6, 6, 1, '2023-06-15'),
    (7, 7, 10, 2, '2023-07-20'),
    (8, 8, 7, 5, '2023-08-25'),
    (9, 9, 8, 3, '2023-09-10'),
    (10, 10, 9, 1, '2023-10-15');

INSERT INTO TimeLogs (LogID, TaskID, UserID, StartTime, EndTime, Duration)
VALUES 
    (6, 7, 14, '2023-09-01 09:00:00', '2023-09-01 17:00:00', '8 hours'),
    (7, 8, 3, '2023-09-02 10:00:00', '2023-09-02 15:00:00', '5 hours'),
    (8, 9, 11, '2023-09-03 08:00:00', '2023-09-03 16:00:00', '8 hours'),
    (9, 10, 13, '2023-09-04 09:30:00', '2023-09-04 17:30:00', '8 hours'),
    (10, 11, 4, '2023-09-05 10:00:00', '2023-09-05 18:00:00', '8 hours');

INSERT INTO ProgressReports (ReportID, ProjectID, ReportDate, Summary, Status)
VALUES 
    (6, 6, '2023-09-15', 'AI model training is 70% complete.', 'On Track'),
    (7, 7, '2023-09-20', 'Blockchain node setup delayed.', 'Delayed'),
    (8, 8, '2023-10-01', 'IoT device configuration planned.', 'Planned'),
    (9, 9, '2023-10-15', 'Security testing completed successfully.', 'Completed'),
    (10, 10, '2023-10-20', 'Login page redesign in progress.', 'On Track');

INSERT INTO Risks (RiskID, ProjectID, Description, Probability, Impact)
VALUES 
    (6, 6, 'Insufficient training data may reduce model accuracy', 'High', 'High'),
    (7, 7, 'Blockchain node setup may face technical issues', 'Medium', 'Medium'),
    (8, 8, 'IoT devices may not meet security standards', 'Low', 'High'),
    (9, 9, 'Security vulnerabilities may remain undetected', 'Medium', 'High'),
    (10, 10, 'Design changes may cause delays', 'High', 'Medium');

INSERT INTO Issues (IssueID, ProjectID, Title, Status, ReportedBy)
VALUES 
    (6, 6, 'AI model overfitting issue', 'Open', 14),
    (7, 7, 'Blockchain node setup failure', 'Resolved', 11),
    (8, 8, 'IoT device connectivity problem', 'Open', 13),
    (9, 9, 'Security tool license expired', 'Closed', 4),
    (10, 10, 'Login page design feedback delay', 'Open', 6);