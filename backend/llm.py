def get_llm():
    """
    Dummy/local LLM interface.
    Returns None to indicate no external LLM is used.
    Agents will fall back to rule-based responses.
    """
    return None
