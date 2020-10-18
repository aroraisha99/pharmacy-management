# pharmacy-management
Pharmacy management system is a user-friendly application for Pharmacist
which reduces the burden and helps to manage all sections of Pharmacy like
Medicine management and Billing etc., which improve the processing efficiency.
It deals with the automating tasks of maintaining of Bills. This project constitutes entities
named pharmacist, invoice, invoice_details, admin, paymenttypes, receipts,
stocks and prescription_details. In total the no. of transactions applied are six
viz. Invoice_detail has customer to customer_id in invoice, pharmacist has
first_name to served_by in invoice, receipt has payType to id in paymenttypes
and customer_id to customer in invoice_details, prescription_detail has drug to
stock_id in stock and id to customer_id in invoice. After analysing the Relational
schema, it was observed that all the entities in this project are strong entities
except prescription_details as it depends on the id of the customer relation to
exist and for every entity a corresponding relation is created. None of the three
normal forms are violated while doing this project. This, project included the use
of triggers on different entities along with the aggregate, correlated-nested and
join queries as well. 
This project runs on localhost on phpmyadmin
