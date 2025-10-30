
# Food Waste Management System (SQL Project)

## Overview
This project is a *SQL-based Food Waste Management System* designed to manage and track food donations between *food providers, NGOs, and donation coordinators*.  
It simulates how surplus food can be collected, requested, and delivered efficiently.

The database contains multiple entities such as *Food Providers, NGOs, Donation Coordinators, Food Data, Donation Requests, and Transactions*.  
It also includes sample data and queries to demonstrate real-world use cases.

---

## Database Structure
### Tables
1. *foodprovider* – Stores donor details (restaurants, individuals, etc.)  
2. *NGO* – Stores NGO details that receive donations  
3. *DonationCoordinator* – Stores intermediary details (connects providers and NGOs)  
4. *fooddata* – Stores information about donated food items  
5. *donationrequest* – Stores food requests made by NGOs  
6. *donationtransaction* – Captures completed donation transactions  

---

## Sample Queries
The project includes *SQL queries* to answer questions like:
- What food was donated in a given transaction?  
- Which provider donated a specific food item?  
- Total food donated on a specific date  
- NGO with the maximum donations received  
- Total food requested vs. total food delivered  
- Coordinators handling donation transactions  
- Food donations expiring after a specific date  

---
