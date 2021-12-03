class ApplicationController < ActionController::Base
  def index
    case index_params[:type]
    when 'all'
      @response = NewsApiAllNewsQuery.new(
        search: index_params[:search],
        category: index_params[:category]
      ).call
    when 'top'
      @response = NewsApiTopStoryQuery.new(
        search: index_params[:search],
        category: index_params[:category]
      ).call
    end
  end

  private

  def index_params
    case params[:type]
    when 'all', 'top'
      params.permit(:type, :search, :category)
    else
      params
    end
  end
end
