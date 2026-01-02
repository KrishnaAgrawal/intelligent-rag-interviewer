import psycopg2

def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="game_interviewer",
        user="postgres",
        password="Admin@123"
    )
