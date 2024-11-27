
-- Task 1: Stored Procedure increase_value
CREATE OR REPLACE FUNCTION increase_value(input_value INT)
RETURNS INT AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

-- Task 2: Stored Procedure compare_numbers
CREATE OR REPLACE PROCEDURE compare_numbers(a INT, b INT, OUT result TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    IF a > b THEN
        result := 'Greater';
    ELSIF a = b THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$;

-- Task 3: Stored Procedure number_series
CREATE OR REPLACE PROCEDURE number_series(n INT, OUT series TEXT)
LANGUAGE plpgsql AS $$
DECLARE
    i INT;
BEGIN
    series := '';
    FOR i IN 1..n LOOP
        series := series || i || ',';
    END LOOP;
    -- Remove trailing comma
    series := TRIM(BOTH ',' FROM series);
END;
$$;

-- Task 4: Stored Procedure find_employee
CREATE OR REPLACE PROCEDURE find_employee(emp_name TEXT, OUT emp_details JSON)
LANGUAGE plpgsql AS $$
BEGIN
    SELECT row_to_json(emp) INTO emp_details
    FROM employees emp
    WHERE emp.name = emp_name;
END;
$$;

-- Task 5: Stored Procedure list_products
CREATE OR REPLACE PROCEDURE list_products(category_name TEXT, OUT product_table TABLE (id INT, name TEXT, price NUMERIC))
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, price
    FROM products
    WHERE category = category_name;
END;
$$;

-- Task 6: Two Procedures: calculate_bonus and update_salary
CREATE OR REPLACE PROCEDURE calculate_bonus(emp_id INT, OUT bonus NUMERIC)
LANGUAGE plpgsql AS $$
BEGIN
    SELECT salary * 0.1 INTO bonus FROM employees WHERE id = emp_id;
END;
$$;

CREATE OR REPLACE PROCEDURE update_salary(emp_id INT)
LANGUAGE plpgsql AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    CALL calculate_bonus(emp_id, bonus);
    UPDATE employees SET salary = salary + bonus WHERE id = emp_id;
END;
$$;

-- Task 7: Stored Procedure complex_calculation
CREATE OR REPLACE FUNCTION complex_calculation(num_value INT, str_value VARCHAR)
RETURNS TEXT AS $$
DECLARE
    numeric_result INT;
    string_result VARCHAR;
    final_result TEXT;
BEGIN
    -- Subblock 1: Numeric computation
    <<numeric_computation>>
    BEGIN
        numeric_result := num_value * 2;
    END numeric_computation;

    -- Subblock 2: String manipulation
    <<string_manipulation>>
    BEGIN
        string_result := CONCAT('Hello, ', str_value);
    END string_manipulation;

    -- Combine results
    final_result := string_result || ' - Final Number: ' || numeric_result;
    RETURN final_result;
END;
$$ LANGUAGE plpgsql;
