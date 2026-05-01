{{
    config(
        strategy= "timestamp",
        updated_at= "elt_date",
        unique_key= "extension_id",
        hard_deletes='invalidate'
    )
}}