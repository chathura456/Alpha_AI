class Suggestion {
  final String categoryName;
  final String topic;
  final String prompt;

  Suggestion({required this.categoryName, required this.topic, required this.prompt});
}

List<Suggestion> suggestions = [
  
  // Knowledge
  Suggestion(categoryName: 'Knowledge', topic: 'Science Chat', prompt: 'Act like a Professor. Every time I write "fyi", you will give me new information. You will present interesting information from basic sciences such as history and physics.'),
  Suggestion(categoryName: 'Knowledge', topic: 'World Facts', prompt: 'Provide me with intriguing facts about countries, cultures, and landmarks from around the world whenever I ask.'),
  Suggestion(categoryName: 'Knowledge', topic: 'Space Exploration', prompt: 'Discuss the wonders of the universe, from black holes to galaxies, and share the latest discoveries in space exploration.'),
  Suggestion(categoryName: 'Knowledge', topic: 'Historical Events', prompt: 'Dive deep into significant events from the past, explaining their context, impact, and relevance to today.'),
  Suggestion(categoryName: 'Knowledge', topic: 'Tech Innovations', prompt: 'Discuss the latest technological advancements, their implications, and future predictions.'),
  Suggestion(categoryName: 'Knowledge', topic: 'Philosophy Insights', prompt: 'Delve into philosophical topics, theories, and thinkers, offering insights and perspectives.'),
  Suggestion(categoryName: 'Knowledge', topic: 'Medical Discoveries', prompt: 'Share recent advancements and discoveries in the field of medicine and healthcare.'),
  Suggestion(categoryName: 'Knowledge', topic: 'Environmental News', prompt: 'Update me on environmental issues, conservation efforts, and sustainable practices.'),

  // Writing
  Suggestion(categoryName: 'Writing', topic: 'Story Creation', prompt: 'Craft a captivating story based on the themes or characters I provide.'),
  Suggestion(categoryName: 'Writing', topic: 'Poetry', prompt: 'Compose poetic verses based on the mood, theme, or style I specify.'),
  Suggestion(categoryName: 'Writing', topic: 'Song Lyrics', prompt: 'Write song lyrics based on a given genre, mood, or topic.'),
  Suggestion(categoryName: 'Writing', topic: 'Speech Writing', prompt: 'Help me draft compelling speeches for various occasions or topics.'),
  Suggestion(categoryName: 'Writing', topic: 'Creative Prompts', prompt: 'Provide unique writing prompts to spark my creativity and imagination.'),
  Suggestion(categoryName: 'Writing', topic: 'Blog Post Ideas', prompt: 'Suggest engaging blog post topics or formats for my website or audience.'),
  Suggestion(categoryName: 'Writing', topic: 'Screenwriting Tips', prompt: 'Guide me through the process of screenwriting, from plot development to character arcs.'),
  Suggestion(categoryName: 'Writing', topic: 'Book Reviews', prompt: 'Help me write insightful book reviews, discussing themes, characters, and overall impressions.'),

  // Summaries
  Suggestion(categoryName: 'Summaries', topic: 'Book Summaries', prompt: 'Provide concise summaries and key takeaways from popular books across genres.'),
  Suggestion(categoryName: 'Summaries', topic: 'Movie Recaps', prompt: 'Recap the plot, characters, and themes of movies, helping me understand their essence.'),
  Suggestion(categoryName: 'Summaries', topic: 'Research Articles', prompt: 'Break down complex research articles into understandable summaries, highlighting the main findings and implications.'),
  Suggestion(categoryName: 'Summaries', topic: 'News Digest', prompt: 'Offer a brief overview of current events and news stories from around the world.'),
  Suggestion(categoryName: 'Summaries', topic: 'Historical Overviews', prompt: 'Provide a concise summary of historical periods, events, or figures.'),
  Suggestion(categoryName: 'Summaries', topic: 'Product Overviews', prompt: 'Give me a rundown of products, their features, benefits, and comparisons with competitors.'),
  Suggestion(categoryName: 'Summaries', topic: 'Tech Trends', prompt: 'Summarize the latest tech trends, innovations, and their potential impact on industries.'),
  Suggestion(categoryName: 'Summaries', topic: 'Music Album Reviews', prompt: 'Review music albums, discussing tracks, themes, and artist performances.'),

  // Translation
  Suggestion(categoryName: 'Translation', topic: 'Language Practice', prompt: 'Help me practice and improve my language skills by translating sentences and offering corrections.'),
  Suggestion(categoryName: 'Translation', topic: 'Cultural Context', prompt: 'Translate phrases or sentences while providing cultural context and nuances.'),
  Suggestion(categoryName: 'Translation', topic: 'Idioms & Proverbs', prompt: 'Explain and translate idioms, proverbs, and sayings from various languages.'),
  Suggestion(categoryName: 'Translation', topic: 'Business Communication', prompt: 'Assist in translating business documents, emails, or presentations, ensuring accuracy and professionalism.'),
  Suggestion(categoryName: 'Translation', topic: 'Literary Translation', prompt: 'Translate literary texts, poems, or quotes, preserving their essence and beauty.'),
  Suggestion(categoryName: 'Translation', topic: 'Medical Terms', prompt: 'Translate and explain medical terms, procedures, or conditions, ensuring clarity and understanding.'),
  Suggestion(categoryName: 'Translation', topic: 'Legal Documents', prompt: 'Help translate legal documents, contracts, or terms, ensuring accuracy and adherence to legal standards.'),
  Suggestion(categoryName: 'Translation', topic: 'Tech & Coding', prompt: 'Translate and explain tech jargon, coding terms, or software documentation.'),


// Learning
  Suggestion(
    categoryName: 'Learning',
    topic: 'Math Tutor',
    prompt: 'Act as a math tutor. Whenever I present a problem or concept, guide me through the solution or explanation step-by-step.',
  ),
  Suggestion(
    categoryName: 'Learning',
    topic: 'Language Lessons',
    prompt: 'Provide lessons on grammar, vocabulary, and pronunciation for the language I specify. Offer exercises and corrections as needed.',
  ),
  Suggestion(
    categoryName: 'Learning',
    topic: 'Coding Guide',
    prompt: 'Assist me in understanding coding concepts, languages, or algorithms. Offer examples, explanations, and debugging help.',
  ),
  Suggestion(
    categoryName: 'Learning',
    topic: 'Art & Craft Tutorials',
    prompt: 'Guide me through various art and craft techniques, materials, and projects suitable for my skill level.',
  ),
  Suggestion(
    categoryName: 'Learning',
    topic: 'Music Lessons',
    prompt: 'Teach me about music theory, instruments, or voice techniques. Provide exercises and feedback on my progress.',
  ),

// Ideas
  Suggestion(
    categoryName: 'Ideas',
    topic: 'Brainstorming Sessions',
    prompt: 'Help me brainstorm ideas for projects, stories, businesses, or any other domain I specify.',
  ),
  Suggestion(
    categoryName: 'Ideas',
    topic: 'Innovation Concepts',
    prompt: 'Discuss innovative concepts, technologies, or trends in the field I mention.',
  ),
  Suggestion(
    categoryName: 'Ideas',
    topic: 'Creative Writing Prompts',
    prompt: 'Provide unique and inspiring writing prompts to ignite my creativity.',
  ),
  Suggestion(
    categoryName: 'Ideas',
    topic: 'Business Ideas',
    prompt: 'Suggest potential business ideas or ventures based on current market trends and opportunities.',
  ),
  Suggestion(
      categoryName: 'Ideas',
      topic: 'DIY Projects',
      prompt: "Recommend DIY projects or hacks related to home improvement, crafts, or any other area I'm interested in.",
  ),

// Analysis
  Suggestion(
    categoryName: 'Analysis',
    topic: 'Data Interpretation',
    prompt: 'Help me interpret and analyze data sets, charts, or graphs. Provide insights, trends, and conclusions.',
  ),
  Suggestion(
    categoryName: 'Analysis',
    topic: 'Literary Analysis',
    prompt: 'Analyze literary texts, discussing themes, characters, and stylistic elements. Offer a deeper understanding of the material.',
  ),
  Suggestion(
    categoryName: 'Analysis',
    topic: 'Market Analysis',
    prompt: 'Discuss current market trends, opportunities, and challenges in the industry I specify.',
  ),
  Suggestion(
    categoryName: 'Analysis',
    topic: 'Film & Media Critique',
    prompt: 'Analyze films, TV shows, or other media, discussing their themes, cinematography, and cultural impact.',
  ),
  Suggestion(
    categoryName: 'Analysis',
    topic: 'Product Reviews',
    prompt: 'Provide detailed reviews and analysis of products or services based on features, usability, and value.',
  ),

  // Fun
  Suggestion(
    categoryName: 'Fun',
    topic: 'Trivia Quiz',
    prompt: 'Challenge me with trivia questions from various categories and test my knowledge.',
  ),
  Suggestion(
    categoryName: 'Fun',
    topic: 'Joke Teller',
    prompt: 'Share a joke or a funny story to lighten up my day.',
  ),
  Suggestion(
    categoryName: 'Fun',
    topic: 'Movie Recommendations',
    prompt: 'Recommend movies based on genres, moods, or themes I specify.',
  ),
  Suggestion(
    categoryName: 'Fun',
    topic: 'Music Playlist Creator',
    prompt: 'Suggest a playlist or songs based on the mood, genre, or occasion I mention.',
  ),
  Suggestion(
    categoryName: 'Fun',
    topic: 'Virtual Tour Guide',
    prompt: 'Take me on a virtual tour of a city, museum, or landmark, sharing interesting facts and stories.',
  ),

// Tech
  Suggestion(
    categoryName: 'Tech',
    topic: 'Tech News Digest',
    prompt: 'Update me on the latest tech news, innovations, and trends in the industry.',
  ),
  Suggestion(
    categoryName: 'Tech',
    topic: 'Gadget Reviews',
    prompt: 'Provide detailed reviews and insights on the latest gadgets, software, or apps.',
  ),
  Suggestion(
    categoryName: 'Tech',
    topic: 'Coding Help',
    prompt: 'Assist me with coding challenges, debugging, or understanding programming concepts.',
  ),
  Suggestion(
    categoryName: 'Tech',
    topic: 'Future Predictions',
    prompt: 'Discuss predictions and trends about the future of technology, AI, and digital innovations.',
  ),
  Suggestion(
    categoryName: 'Tech',
    topic: 'Cybersecurity Tips',
    prompt: 'Educate me on cybersecurity best practices, threats, and ways to protect my digital assets.',
  ),

// Coding
  Suggestion(
    categoryName: 'Coding',
    topic: 'Algorithm Explainer',
    prompt: 'Explain algorithms, their logic, and use-cases in a comprehensible manner.',
  ),
  Suggestion(
    categoryName: 'Coding',
    topic: 'Code Reviewer',
    prompt: 'Review my code snippets, provide feedback, and suggest optimizations.',
  ),
  Suggestion(
    categoryName: 'Coding',
    topic: 'Project Ideas',
    prompt: 'Suggest coding projects or challenges based on my skill level and interests.',
  ),
  Suggestion(
    categoryName: 'Coding',
    topic: 'Language Tutor',
    prompt: 'Teach me programming languages, frameworks, or libraries, offering examples and exercises.',
  ),
  Suggestion(
    categoryName: 'Coding',
    topic: 'Debugging Assistant',
    prompt: 'Help me identify and fix errors or bugs in my code.',
  ),

];
