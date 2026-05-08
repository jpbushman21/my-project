CREATE TABLE products_history (
  history_id   UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  operation    TEXT        NOT NULL,  -- 'INSERT' | 'UPDATE' | 'DELETE'
  changed_at   TIMESTAMPTZ NOT NULL DEFAULT now(),

  -- Mirror of every products column at the time of change
  id           UUID,
  name         TEXT,
  price        NUMERIC(10,2),
  product_description        TEXT,
  created_at   TIMESTAMPTZ,
  updated_at   TIMESTAMPTZ
);
