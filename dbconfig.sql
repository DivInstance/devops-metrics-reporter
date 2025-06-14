--If you’re inside the psql prompt: \i /dbconfig.sql
-- or from terminal psql -U postgres -f /dbconfig.sql


-- Create user
CREATE USER div WITH PASSWORD 'div_password';

-- Create the database (only run this if the DB doesn't already exist)
CREATE DATABASE div OWNER div;

-- Grant all privileges on the database
GRANT ALL PRIVILEGES ON DATABASE devops_metrics TO div;

-- Connect to the database
\connect div

-- Grant schema ownership and privileges
GRANT ALL ON SCHEMA public TO div;
ALTER SCHEMA public OWNER TO div;

-- Table 1: repositories
CREATE TABLE repositories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    owner TEXT NOT NULL,
    platform TEXT CHECK (platform IN ('github', 'gitlab')) NOT NULL,
    url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table 2: workflows
CREATE TABLE workflows (
    id SERIAL PRIMARY KEY,
    repo_id INTEGER REFERENCES repositories(id),
    name TEXT NOT NULL,
    workflow_file TEXT,
    status TEXT,
    last_run TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table 3: workflow_runs
CREATE TABLE workflow_runs (
    id SERIAL PRIMARY KEY,
    workflow_id INTEGER REFERENCES workflows(id),
    run_id BIGINT NOT NULL,
    status TEXT CHECK (status IN ('success', 'failure', 'cancelled', 'in_progress')),
    started_at TIMESTAMP,
    completed_at TIMESTAMP,
    duration_seconds INTEGER,
    triggered_by TEXT
);

-- Table 4: alerts
CREATE TABLE alerts (
    id SERIAL PRIMARY KEY,
    workflow_run_id INTEGER REFERENCES workflow_runs(id),
    alert_type TEXT,
    message TEXT,
    severity TEXT CHECK (severity IN ('low', 'medium', 'high', 'critical')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table 5: metrics
CREATE TABLE metrics (
    id SERIAL PRIMARY KEY,
    workflow_run_id INTEGER REFERENCES workflow_runs(id),
    key TEXT,
    value TEXT,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
