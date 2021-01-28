class UrlStatisticsController < ApplicationController
  before_action :find_url

  # Show all statistics for a given URL
  def index
    @statistics = @url.url_statistics
  end

  private

  def find_url
    @url = UserUrl.find(params[:user_url_id])
  end
end