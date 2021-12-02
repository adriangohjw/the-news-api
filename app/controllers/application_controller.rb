class ApplicationController < ActionController::Base
  def index
    case index_params[:type]
    when 'top'
      @response = NewsApiTopStoryQuery.new(
        search: index_params[:search]
      ).call
    end
  end

  private

  def index_params
    case params[:type]
    when 'top'
      params.permit(:type, :search)
    else
      params
    end
  end
end
