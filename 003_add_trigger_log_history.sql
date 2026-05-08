  CREATE OR REPLACE FUNCTION log_products_history()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO products_history (action, id, name, price, product_description, created_at, updated_at)
    VALUES ('DELETE', OLD.id, OLD.name, OLD.price, OLD.product_description, OLD.created_at, OLD.updated_at);
  ELSE
    INSERT INTO products_history (action, id, name, price, product_description, created_at, updated_at)
    VALUES (TG_OP, OLD.id, OLD.name, OLD.price, OLD.product_description, OLD.created_at, OLD.updated_at);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
