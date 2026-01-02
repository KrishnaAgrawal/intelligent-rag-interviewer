import asyncio
from core.router import route
from rag.retriever import retrieve_context
from database.queries import fetch_constraints, fetch_archetypes
from agents.creative_agent import creative_agent
from agents.technical_agent import technical_agent
from agents.evaluator_agent import evaluator_agent
from llm import get_llm


async def run_in_thread(func, *args):
    loop = asyncio.get_event_loop()
    return await loop.run_in_executor(None, func, *args)


async def handle_query(query: str):
    if is_system_question(query):
        return (
            "The chatbot returned irrelevant content because the question "
            "was routed to the vector database containing game design documents. "
            "Retrieval-Augmented Generation can only answer questions using "
            "available knowledge sources. Since system-level API knowledge "
            "was not present, irrelevant content was retrieved."
        )

    routing = route(query)

    # Try to load LLM (may be None or local)
    try:
        llm = get_llm()
    except Exception:
        llm = None

    # VECTOR ONLY
    if routing == "VECTOR":
        context = retrieve_context(query)
        return await run_in_thread(
            creative_agent, context, query, llm
        )

    # SQL ONLY
    if routing == "SQL":
        sql_data = fetch_archetypes()
        return await run_in_thread(
            technical_agent, sql_data, query, llm
        )

    # HYBRID
    context = retrieve_context(query)
    sql_data = fetch_constraints()

    creative_task = run_in_thread(
        creative_agent, context, query, llm
    )
    technical_task = run_in_thread(
        technical_agent, sql_data, query, llm
    )

    creative_resp, technical_resp = await asyncio.gather(
        creative_task, technical_task
    )

    return await run_in_thread(
        evaluator_agent, creative_resp, technical_resp, llm
    )

def is_system_question(query: str) -> bool:
    system_keywords = [
        "fastapi", "api endpoint", "http",
        "json request", "pydantic",
        "import error", "module not found",
        "uvicorn", "server", "backend",
        "database error", "sql error"
    ]
    q = query.lower()
    return any(k in q for k in system_keywords)
