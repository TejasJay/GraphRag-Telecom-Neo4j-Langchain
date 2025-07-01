
# 📊 GraphRAG Telecom Agent

This project is an **LLM-powered Graph + Vector Retrieval Augmented Generation (RAG)** system for telecom project templates and task tracking. It combines Neo4j (graph DB), Qdrant (vector DB), and an LLM agent (OpenAI or Gemini) via LangChain to answer complex questions about telecom infrastructure rollout.

* * *

## 🚀 What It Does

-   🧠 **Understands telecom project data** (tasks, templates, owners, timelines)
-   🔗 **Uses Neo4j** to model relationships like:
    -   `Project → Task → Template`
    -   `Task → DEPENDS_ON → Task`
-   📦 **Embeds template text metadata** into Qdrant for semantic search
-   🤖 **Runs a LangChain agent** with tools:
    -   `Graph QA`: Answers relational queries using Cypher
    -   `Template Lookup`: Answers template-based questions with semantic vector search
* * *

## 📚 Data Used

### `templates.csv`

| template\_id | template\_name | required\_roles |
| --- | --- | --- |
| TEMPLATE-001 | 5G Tower Installation | Technician, Engineer |

### `projects_tasks.csv`

| project\_id | task\_id | task\_name | owner | start\_date | dependency |
| --- | --- | --- | --- | --- | --- |
| PROJ-00001 | TASK-001 | Power Backup Setup - Survey | James Smith | 2024-10-27 | NaN |

* * *

## 🧱 Architecture

```
User Query
   |
   ↓
LangChain Agent (LLM)
   ├── Tool: GraphCypherQAChain → Neo4j (structured)
   └── Tool: RetrievalQA         → Qdrant (semantic)
```

* * *

## 🛠️ Technologies

-   **LangChain**
-   **Neo4j 5.x** (for graph relationships)
-   **Qdrant** (vector DB for template embedding)
-   **OpenAI GPT-4 / Gemini Pro**
-   **Docker Compose** (multi-container orchestration)
-   **Jupyter** (development environment)
* * *

## 💡 Example Queries

-   "What are the tasks under PROJ-00003?"
-   "Which projects took the longest time?"
-   "Who owns the task 'Survey' in Chennai?"
-   "Which templates require QA role?"
-   "Which tasks depend on TASK-000003?"
* * *

## 🧩 How It Works

1.  **Data ingestion:**
    -   Cleans and inserts `projects_tasks.csv` and `templates.csv` into Neo4j.
    -   Converts date strings to Neo4j `date()` format.
    -   Handles task dependencies via `:DEPENDS_ON` relationships.
2.  **Vector embedding:**
    -   Creates OpenAI/Gemini embeddings of template descriptions.
    -   Stores them in Qdrant with metadata.
3.  **Agent-based query handling:**
    -   Queries with relational structure → Neo4j via Cypher
    -   Questions with fuzzy or semantic match → Qdrant vector search
* * *

## 🧼 Resets & Fixes

-   Automatically deletes all Neo4j data before re-inserting.
-   Handles malformed dates and NaNs gracefully.
-   Auto-escapes quotes in Cypher.
-   Avoids DATEDIFF errors by casting dates or using `duration.between()`.
* * *

## ⚙️ Setup (Quick Steps)

1.  Clone the repo & ensure Docker is installed.
2.  Launch services:

```bash
docker-compose up --build
```

3.  Open `http://localhost:8888` for Jupyter and run the notebook.
4.  Configure `.env` with `OPENAI_API_KEY` or `GOOGLE_API_KEY`.
* * *


