# Ag Market
## Organizational Overview
1. Executive Broker
    1. Inside Brokers
    2. Outside Brokers
2. Executive Support
    1. Market Support Specialists
    2. Logistics Support Specialists

## Security
---
### Permission Abbreviations
- C: Create
- R: Read
- U: Update
- D: Delete
- VA: View All
- MA: Modify All
### General
- **Accounts:** Can be viewed by anyone, except Outside Brokers unless they own the account.
- **Opportunities:** Not accessible to anyone outside of the brokerage department, except for managers above owners in the role hierarchy.
- **Orders:** Can be viewed by anyone in the Org
- **Trades, Deliveries & Shipments:** RU to owners, managers above owners, and respective support department.
### Inside Brokers User Permissions
- **Orers:** CRUD their own, CRU other Inside Brokers
- **Trades:** no extra permissions
- **Deliveries:** CRUD their own
- **Shipments:** no extra permissions
#### 
### Outside Brokers User Permissions
- **Orers:** CRUD their own
- **Trades:** no extra permissions
- **Deliveries:** CRUD their own
- **Shipments:** no extra permissions
### Executive Broker User Permissions
- **Orers:** U for Inside Brokers
- **Trades:** no extra permissions
- **Deliveries:** U for Inside Brokers
- **Shipments:** no extra permissions
### Market Support Specialists User Permissions
- **Orers:** RUD all
- **Trades:** RU
- **Deliveries:** no extra permissions
- **Shipments:** no extra permissions
### Logistic Support Specialists User Permissions
- **Orers:** no extra permissions
- **Trades:** no extra permissions
- **Deliveries:** RUD
- **Shipments:** RU
### Executive Broker Support User Permissions
- **Orers:** RUD
- **Trades:** RU
- **Deliveries:** RUD
- **Shipments:** RU

## Sales Cloud
---
## Lead Assignments
### Web-to-Lead
- To Inside Broker Ag Queue if potential Ag client
- To Inside Broker Distributor Queue if potential Distributor
### Email-to-Lead
- To Inside Broker Ag Queue if potential Ag client
- To Inside Broker Distributor Queue if potential Distributor
### Opportunity Path
- Guided for inside sales and include celebratory effect
### Products
- transaction fees
- logistics fees
### Pricebooks
- Discounted transaction fees for high volume accounts

## Service Cloud
---
- 3 Assignment Rules
- 3 Escalation Rules
- 1 Web-to-Case

## UI 
---
### Custom App with Custom Home Page
- For Brokers
- Object Record Types
- One object-specific quick action
- One global quick action

## Process Automation
### Flows
- One of each Flow Type
    - Interact w/ database
    - Work with both single and bulk records

## Reports & Dashboards
- Use of both Standard & Custom Report Types
