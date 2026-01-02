def creative_agent(context, query, llm=None):
    """
    Converts raw retrieved academic text into
    an interview-style, human-readable answer.
    """

    # 1. Clean obvious noise
    lines = context.split("\n")
    clean_lines = [
        l for l in lines
        if len(l.strip()) > 20
        and "table" not in l.lower()
        and "figure" not in l.lower()
        and "volume" not in l.lower()
        and "@" not in l
    ]

    condensed_context = " ".join(clean_lines[:8])  # limit noise

    # 2. Structured answer template
    answer = f"""
    Based on character design theory - {condensed_context} this highlights the importance of visual clarity, proportions, and background in character design.
    """

    return answer.strip()
