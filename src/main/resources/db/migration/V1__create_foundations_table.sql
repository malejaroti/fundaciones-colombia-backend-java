CREATE TABLE IF NOT EXISTS foundations (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    department TEXT NOT NULL,
    city TEXT NOT NULL,
    logo TEXT,
    linked_in TEXT,
    instagram TEXT,
    website TEXT,
    facebook TEXT,
    youtube TEXT,
    instagram_secondary TEXT,
    corporate BOOLEAN,
    causes JSONB NOT NULL DEFAULT '[]'::jsonb,
    beneficiaries JSONB NOT NULL DEFAULT '[]'::jsonb,
    intervention_sites JSONB NOT NULL DEFAULT '[]'::jsonb,
    interventions JSONB NOT NULL DEFAULT '[]'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT foundations_causes_is_array CHECK (jsonb_typeof(causes) = 'array'),
    CONSTRAINT foundations_beneficiaries_is_array CHECK (jsonb_typeof(beneficiaries) = 'array'),
    CONSTRAINT foundations_intervention_sites_is_array CHECK (jsonb_typeof(intervention_sites) = 'array'),
    CONSTRAINT foundations_interventions_is_array CHECK (jsonb_typeof(interventions) = 'array')
);

CREATE INDEX IF NOT EXISTS idx_foundations_name ON foundations(name);
CREATE INDEX IF NOT EXISTS idx_foundations_department ON foundations(department);

