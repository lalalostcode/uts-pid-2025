# 🚚 Truck Sensor Data Analysis 📊

This project provides a comprehensive set of tools and scripts for collecting, processing, analyzing, and visualizing sensor data from a fleet of trucks. It includes components for database setup, data ingestion, data cleaning, anomaly detection, and data exploration. The project leverages various technologies, including Docker, MongoDB, MySQL, Python (with Pandas), and Jupyter Notebooks, to provide a flexible and scalable solution for managing and analyzing truck sensor data.

## 🚀 Key Features

*   **Data Ingestion:** Scripts to load sensor data from JSON files into databases (MongoDB and MySQL).
*   **Data Cleaning:** Notebooks to identify and handle data quality issues, such as missing or invalid values.
*   **Data Aggregation:** Tools to calculate aggregate statistics, such as average temperature and maximum humidity per truck.
*   **Anomaly Detection:** SQL queries to detect temperature anomalies in sensor readings.
*   **Database Management:** Docker Compose configurations for setting up and managing MongoDB and MySQL databases.
*   **Web-Based Admin Interface:** Includes phpMyAdmin for managing MySQL databases and MongoDB Express for MongoDB.
*   **Containerized Deployment:** Uses Docker and Docker Compose for easy deployment and management of all components.
*   **Data Exploration:** Jupyter Notebooks for interactive data analysis and visualization.

## 🛠️ Tech Stack

*   **Languages:**
    *   SQL
    *   Python
    *   JavaScript (MongoDB Shell)
*   **Databases:**
    *   MongoDB
    *   MySQL
*   **Data Analysis & Manipulation:**
    *   Pandas
*   **Containerization:**
    *   Docker
    *   Docker Compose
*   **Web Interface:**
    *   phpMyAdmin
    *   MongoDB Express
*   **Environment:**
    *   Jupyter Notebook
*   **Operating System:**
    *   Platform Independent (Containerized)

## 📦 Getting Started / Setup Instructions

### Prerequisites

*   **Docker:**  Make sure you have Docker installed on your system. You can download it from [Docker's official website](https://www.docker.com/get-started).
*   **Docker Compose:** Docker Compose is required to run the multi-container applications. It usually comes with Docker Desktop.
*   **Python 3.x:** Required for running the Jupyter Notebooks.
*   **Pandas:** Install pandas using `pip install pandas`.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <repository_directory>
    ```

2.  **MongoDB Setup:**

    *   Navigate to the `Q2B` directory: `cd Q2B`
    *   Run Docker Compose: `docker-compose up -d`
    *   This will start MongoDB and MongoDB Express.  You can access MongoDB Express at `http://localhost:8081`.

3.  **MySQL Setup (Q2A & Q3):**

    *   Navigate to the `Q2A` or `Q3` directory: `cd ../Q2A` or `cd ../Q3`
    *   Run Docker Compose: `docker-compose up -d`
    *   This will start MySQL and phpMyAdmin. You can access phpMyAdmin at `http://localhost:8080`.

4.  **Install Python Dependencies (for Notebooks):**

    ```bash
    pip install pandas
    ```

### Running Locally

1.  **MongoDB:**

    *   After running `docker-compose up -d` in the `Q2B` directory, the MongoDB database will be accessible at `localhost:27017`.
    *   You can use the `query-mongo.js` script in the MongoDB shell to query the database.

2.  **MySQL:**

    *   After running `docker-compose up -d` in the `Q2A` or `Q3` directory, the MySQL database will be accessible at `localhost:3306`.
    *   You can use phpMyAdmin at `http://localhost:8080` to manage the database.
    *   Execute the SQL scripts (e.g., `q1-queries.sql` or `q3-queries.sql`) against the database.

3.  **Jupyter Notebooks:**

    *   Navigate to the directory containing the notebook (e.g., `Q1`, `Q4`, `Q5`).
    *   Run Jupyter Notebook: `jupyter notebook`
    *   Open the notebook in your browser and execute the cells.

## 📂 Project Structure

```
├── Q1/
│   └── Q1_PID_SOLVE.ipynb
├── Q2A/
│   ├── init/
│   │   └── build.sql
│   ├── mysql-docker-compose.yml
│   └── q1-queries.sql
├── Q2B/
│   ├── init/
│   │   └── init-mongo.js
│   ├── mongo-docker-compose.yml
│   └── query-mongo.js
├── Q3/
│   ├── init/
│   │   └── sample_database.sql
│   ├── mysql-q3-docker-compose.yml
│   ├── q3-queries.sql
├── Q4/
│   ├── q4-etl.ipynb
│   └── sensors.json
├── Q5/
│   └── q5-qualitydata.ipynb
└── README.md
```

## 💖 Thanks Message

Thank you for your interest in this project! We hope it helps you with your truck sensor data analysis needs.

