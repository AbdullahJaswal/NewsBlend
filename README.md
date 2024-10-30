# NewsBlend

## Summary

**NewsBlend** is an app designed to simplify news consumption. It uses a custom API to gather articles from the World News API based on user queries and integrates the ChatGPT API to provide concise summaries. It highlights sensational news as "breaking news" and allows users to customize the display format.

## Overview

The **NewsBlend** app aims to provide quick and efficient access to summarized news articles. It helps users stay informed without spending too much time reading long articles across various websites.

- **Breaking News Alerts:** Key stories are marked as "breaking news," ensuring users never miss critical updates.
- **Customizable Display:** Users can choose between viewing news summaries as bullet points or in paragraphs.
- **Efficient Information Processing:** Preprocessed data minimizes external API calls, reducing costs.

## Contributors

- **Suraj Chodankar**
- **Abdullah Jaswal**

## Topics

### Features

- **News Summarization:** Automatic summarization of articles using the ChatGPT API, giving users a quick digest of key information.
- **Breaking News Alerts:** Sensational and urgent news is flagged for immediate attention.
- **Customizable Format:** Users can choose between different formats (e.g., bullet points or paragraphs) for viewing news summaries.
- **Contextual Insights:** Additional information and context are provided through underlined keywords.

### Technologies

- **World News API:** Fetches real-time news articles from various sources.
- **ChatGPT API:** Summarizes fetched articles for quick and easy reading.
- **Swift:** Implements a smooth user interface and user experience.
- **SwiftData:** Used for persisting bookmarked news articles locally


## Data Requirements

To reduce external API usage, NewsBlend processes articles in batches. An AWS Lambda function periodically fetches new articles from the **World News API** and applies **OpenAI GPT** to summarize them. The summarized content is stored in a database, which the app fetches from, minimizing real-time API costs.

**NewsBlend API:** [https://newsblend.abdullahjaswal.com](https://newsblend.abdullahjaswal.com)

## References

1. [Apple Human Interface Guidelines: Search Fields](https://developer.apple.com/design/human-interface-guidelines/search-fields)
2. [Apple Human Interface Guidelines: Tab Bars](https://developer.apple.com/design/human-interface-guidelines/tab-bars)
3. [Apple Human Interface Guidelines: Typography](https://developer.apple.com/design/human-interface-guidelines/typography)
4. [Apple Human Interface Guidelines: Scroll Views](https://developer.apple.com/design/human-interface-guidelines/scroll-views)
