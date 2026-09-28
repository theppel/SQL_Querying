# SQL Querying Project

This project uses the [olist]("https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce?select=olist_order_items_dataset.csv) dataset from Kaggle. It is a series of transactions stored across 9 tables based on a hypothetical Brazilian company.

The `.csv` files from Kaggle were imported to a PostgreSQL database in DBeaver, where the SQL queries in the [SQL Folder]("https://github.com/theppel/SQL_Querying/tree/main/SQL") were written. These were then exported as `.csv` files (see [CSVs Folder]("https://github.com/theppel/SQL_Querying/tree/main/CSVs)), and written up in jupyter notebooks (see [Python Folder]("https://github.com/theppel/SQL_Querying/tree/main/Python")).

Directory:
- SQL
  - [`Database_setup.sql`]("https://github.com/theppel/SQL_Querying/blob/main/SQL/Database_setup.sql") - Sets up the database and foreign keys from `.csv` files.
  - [`Growth.sql`]("https://github.com/theppel/SQL_Querying/blob/main/SQL/Growth.sql") - Contains a query to return quarterly revenue and profit, as well as quarter-on-quarter growth for both profit and revenue.
  - [`Retention.sql`]("https://github.com/theppel/SQL_Querying/blob/main/SQL/Retention.sql") - Contains a query to return information about customer retention based on how long an order took to arrive after ordering.
  - [`Weight_Volume.sql`]("https://github.com/theppel/SQL_Querying/blob/main/SQL/Weight_Volume.sql") - Contains a query to return the monthly weight and volume of items shipped grouped by seller state.
- Python
  - [`Growth.ipynb`]("https://github.com/theppel/SQL_Querying/blob/main/Python/Growth.ipynb") - A jupyter notebook to visualise the data returned by `Growth.sql` using plotly
  - [`Retention.ipynb`]("https://github.com/theppel/SQL_Querying/blob/main/Python/Retention.ipynb") - A jupyter notebook visualising the data returned by `Retention.sql` using plotly
  - [`Shipping.ipynb`]("https://github.com/theppel/SQL_Querying/blob/main/Python/Shipping.ipynb") - A jupyter notebook that creates a plot of monthly shipping weight and volume, and an interactive plot of monthly shipping weight and volume by state
