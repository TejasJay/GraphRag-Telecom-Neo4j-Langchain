
#!/bin/bash
mkdir -p notebooks
cp GraphRAG_Telecom_Fixed_Final.ipynb notebooks/
cp templates.csv notebooks/
cp projects_tasks.csv notebooks/
echo "✅ Notebooks copied. Ready to run: docker-compose up"
