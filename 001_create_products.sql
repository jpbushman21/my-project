CREATE TABLE products (
  id          UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT         NOT NULL,
  price       NUMERIC(10,2) NOT NULL,
  product_description TEXT  NOT NULL,

  -- Audit timestamps (always TIMESTAMPTZ, never TIMESTAMP)
  created_at  TIMESTAMPTZ  NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ  NOT NULL DEFAULT now()
);
