module News
  require 'open-uri'
  class Search
    def self.headlines
      url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['API_KEY']}"
      search_news(url)
    end

    def self.by_keyword(keyword)
      date = DateTime.now.strftime('%Y-%m-%d')
      url = "https://newsapi.org/v2/everything?q=#{keyword}&from=#{date}&sortBy=popularity&apiKey=#{ENV['API_KEY']}"
      search_news(url)
    end

    private

    def self.search_news(url)
      req = open(url)
      response_body = req.read
      response = JSON.parse(response_body)
    end
  end
end