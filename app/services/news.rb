module News
  require 'open-uri'
  class Search
    def self.headlines
      url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=#{ENV['API_KEY']}"
      req = open(url)
      response_body = req.read
      response = JSON.parse(response_body)
    end
  end
end