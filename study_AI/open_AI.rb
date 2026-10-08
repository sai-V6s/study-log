require "openai"

client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

markdown_text = File.read("/mnt/c/Users/Study/desktop/study-log/Git/Gitとは.md")

prompt = <<~PROMPT
  以下のMarkdown文章から、技術用語とその説明を抽出し、
  以下のJSON形式の配列で出力してください。他の文章は含めないでください。

  [
    { "term": "用語", "description": "説明文" }
  ]

  Markdown文章:
  #{markdown_text}
PROMPT

response = client.chat(
  parameters: {
    model: "gpt-4o-mini",
    messages: [{ role: "user", content: prompt }]
  }
)

puts response.dig("choices", 0, "message", "content")