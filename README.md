# LLM-Reading Aid-Visually Impaired
This is code implementation for the paper: LLM-Powered Reading Aid for Visually Impaired Online Learners

# 🔗 Paper &  Demo Video

- 📄 **Paper (Springer)**: [LLM-Powered Reading Aid for Visually Impaired Online Learners](https://link.springer.com/chapter/10.1007/978-981-97-9255-9_19)
- 🎥 **Demo Video**:

https://github.com/user-attachments/assets/a2ee23da-56d1-4dad-89e9-6d98b03caad3



# 📖 Introduction

<img src='figs/overview.png'>

LLM-ReadingAid-VisuallyImpaired is advanced intelligent reader system aimed at improving online extracurricular reading for visually impaired learners. Our system delivers personalized content recommendations and summaries based on users’ historical interests.

# 🖼️ Screenshots
<img src="figs/Screenshots.png" alt="Screenshots Overview" />

This project is a frontend-backend separated application. The frontend is built with Vue 3, and the backend is built with Flask. **This project relies on GPT-series API**, so you need to configure your API credentials before running.

# ⚡️ Getting Started
## Prerequisites

- **Python 3.7+** (for backend)
- **Node.js 14+** and **npm** (for frontend)
- **MySQL 5.7+** (for database)
- **GPT API Key** (OpenAI API or compatible API service)

## Backend Setup (Flask)

### 1. Install Python Dependencies

Navigate to the backend directory and install required packages:

```bash
cd news_recommender_flask
pip install -r requirements.txt
```

### 2. Configure Database

#### Option A: Use Sample Database (Recommended for Quick Start)

We provide a database initialization script to help you set up the database quickly:

1. **Create MySQL database and user** (if not exists):
   ```sql
   CREATE DATABASE news_recommend;
   CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON news_recommend.* TO 'your_username'@'localhost';
   FLUSH PRIVILEGES;
   ```

2. **Initialize database tables**:
   ```bash
   mysql -u your_username -p news_recommend < db/init_database.sql
   ```
   Or import the SQL file using MySQL client tools (phpMyAdmin, MySQL Workbench, etc.)

#### Option B: Manual Database Setup

If you prefer to set up manually, you can execute the SQL statements in `news_recommender_flask/db/init_database.sql` to create all required tables.

### 3. Configure `config.ini`

**⚠️ IMPORTANT**: This project relies on GPT-series API. You must configure the API credentials before running.

1. **Copy the example configuration file** (if `config.ini` doesn't exist):
   ```bash
   cp config/config.ini.example config/config.ini
   ```

2. **Edit `news_recommender_flask/config/config.ini`** with your credentials:

```ini
[database]
db_host = localhost
db_user = your_mysql_username
db_password = your_mysql_password
db_name = news_recommend
db_port = 3306

[llm]
api = your_gpt_api_key_here
model = gpt-4
base_url = your_base_url_here
```

**Configuration Notes**:
- **`api`**: Your GPT API key. If using OpenAI, get it from [OpenAI Platform](https://platform.openai.com/api-keys). If using a compatible API service, use the corresponding API key.
- **`model`**: The model name (e.g., `gpt-4`, `gpt-3.5-turbo`, etc.)
- **`base_url`**: The API endpoint URL. Default is OpenAI's endpoint (`https://api.openai.com/v1`). If using a compatible service, update this accordingly.

### 4. Start Flask Backend Server

```bash
cd news_recommender_flask
python app.py
```

The backend server will start on `http://localhost:5000` (default Flask port).

## Frontend Setup (Vue)

### 1. Install Node.js Dependencies

Navigate to the frontend directory and install dependencies:

```bash
cd news_recommender_vue
npm install
```

### 2. Configure API Proxy (Optional)

If your backend runs on a different host/port, you may need to update the proxy configuration in `vue.config.js`:

```javascript
proxy: {
  "/api": {
    target: "http://localhost:5000",  // Update to your backend URL
    changeOrigin: true,
  },
}
```

### 3. Start Vue Development Server

```bash
npm run serve
```

The frontend will be available at `http://localhost:8080` (default Vue CLI port).

# 🎉 Citation

If you find this code useful, please cite our project:

```
@software{LLM-InSightNews,
    title        = {LLM-Powered Reading Aid for Visually Impaired Online Learners},
    author       = {Zilin Li, Shaofei Shen, and Zhilong Xie},
    year         = 2024,
    journal      = {GitHub repository},
    publisher    = {GitHub},
    howpublished = {{https://github.com/shensf0522/LLM-InSightNews}}
}
```
# 🧡 Acknowledgements

Accessibility-first design for visually impaired learners

LLM-powered summarization & personalized recommendation

Thanks to all contributors and users for feedback!
