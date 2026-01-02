from database.db import get_connection

def fetch_archetypes(genre="RPG"):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT ca.name, ca.role, ca.complexity_level
        FROM character_archetypes ca
        JOIN game_genres gg ON ca.genre_id = gg.genre_id
        WHERE gg.name = %s
    """, (genre,))
    return cur.fetchall()

def fetch_constraints(platform="Mobile"):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
        SELECT max_skills, animation_complexity, memory_budget_mb
        FROM production_constraints pc
        JOIN platforms p ON pc.platform_id = p.platform_id
        WHERE p.name = %s
    """, (platform,))
    return cur.fetchone()
