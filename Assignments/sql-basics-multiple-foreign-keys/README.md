# Multiple foreign keys in one table

## Prerequisites

- Postgres and psql are install and worked

## Overview

We will refactor a simple database to have multiple foreign keys in the same table. You may have seen this database already - it is extremely simple.

### Tables

- Customers:  A very simple customers table.
- Purchases: A very simple purchases table. Currently has a foreign key referencing the customers table

### Installing & running

1. Clone this repo
2. Create a database named `retail_store`. If one already exists, delete it so you can start fresh.
3. Connect to the `retail_store` database in psql
4. Run the `create-customers.sql` and `create-purchases.sql` from psql to create these tables in our database.
5. Run the `insert-customers.sql` and `insert-purchases.sql` from psql to insert some data into our tables
6. Make sure everything is correct.

## Task

We want to move the item name and item cost data out of the `purchases` table, and into a new table we'll create named `items`. This way once we get tens of thousands of purchases we don't constantly have to save the same item name and cost over and over and it reduces the chance for error.

To do this we'll create the new table, modify or delete our `purchases` table, and add a **foreign key** to it pointing to our new `items` table.

## Implementation

You will have to either delete and re-create the existing `purchases` table, and its data, or use the [`ALTER TABLE`](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-alter-table/) SQL statement.

It is probably easier to delete the existing table and data. Once you've done it that way successfully, try doing it the other way!

Here is a rough outline of your implementation process:

- Create a table named `items`:
  - `name`: Name of the item, varchar
  - `cost`: Cost of the item, integer
- Insert data (look at the existing purchases) into our new `items` table.
- Modify the `purchases` table:
  - Remove the `item` and `cost` columns from it
  - Add a foreign key column named `item_id` that references our new `items` table.
- Run a few `SElECT` queries to confirm that everything is as it should be.

