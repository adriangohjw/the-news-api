API_TOKEN = ENV['NEWS_API_KEY']

class NewsApiAllNewsQuery
  API_ENDPOINT = "https://api.thenewsapi.com/v1/news/all?api_token=#{API_TOKEN}&language=en"

  def initialize(search: '')
    @search = search
  end

  def call
    HTTParty.get(build_query)
  end

  private

  def build_query
    query = API_ENDPOINT
    query += "&search=#{@search}" if @search
    query
  end
end
