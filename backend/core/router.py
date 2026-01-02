SQL_TERMS = ["stats", "list", "constraints", "skills"]
VECTOR_TERMS = ["explain", "design", "theory", "why"]

def route(query):
    q = query.lower()
    sql = any(t in q for t in SQL_TERMS)
    vec = any(t in q for t in VECTOR_TERMS)

    if sql and vec:
        return "HYBRID"
    elif sql:
        return "SQL"
    else:
        return "VECTOR"
