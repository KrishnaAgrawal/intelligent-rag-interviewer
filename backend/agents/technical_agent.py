def technical_agent(sql_data, query, llm=None):
    return f"""
    TECHNICAL CONSTRAINTS (from database):
    {sql_data}

    ENGINEERING VIEW:
    Limit the number of skills, reuse animations,
    and optimize effects for the target platform.
    """
