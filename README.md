Overview :

This project automates the Secret Santa assignment process using Python. 


It includes functions to :

- Load employee data from a CSV file

- Assign each employee a Secret Santa recipient

- Save the assignments to a CSV file

- Unit tests to ensure the script functions correctly


Prerequisites :

- Before running the scripts, ensure you have the following installed:

- Python 3.8 or later


Required Python libraries :

- pip install -r requirements.txt

Project Structure :

Secret_santa_py/
│-- secret_santa.py          # Main script for Secret Santa assignments
│-- unit_test.py             # Unit testing script
│-- test/                    # Folder for test CSV files
│   │-- test_employees.csv   # Sample test data
│   │-- test_output.csv      # Output file after assignment
│-- README.md                # Instructions and documentation
│-- requirements.txt         # Dependencies list

Setup Instructions :

- Create the Required Files
- Ensure that the test folder exists and contains test_employees.csv with the following format:

Employee_Name,Employee_EmailID
Alice,alice@example.com
Bob,bob@example.com
Charlie,charlie@example.com

Run the Secret Santa Script

python secret_santa.py

This will generate output.csv with assigned Secret Santa pairs.

Run Unit Tests

python -m unittest unit_test.py

If all tests pass, you should see:

----------------------------------------------------------------------
Ran 6 tests in 0.019s

OK


Troubleshooting :

FileNotFoundError: Ensure that test_employees.csv exists inside the test folder.

ModuleNotFoundError: If dependencies are missing, install them using:

pip install -r requirements.txt
