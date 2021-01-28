class UserUrlsController < ApplicationController

  def index
    @urls = UserUrl.all_urls
  end

  def show
    @url = UserUrl.find(params[:id])
    log_ip_address
    redirect_to @url.long_url
  end

  def create
    @url = UserUrl.new(url_params)
    @url.short_url = @url.make_short_url

    if @url.save
      redirect_to user_urls_path, notice: "Url Created!"
    else
      render :new
    end
  end

  def new
    @url = UserUrl.new
  end

  private

  def url_params
    params.require(:user_url).permit(:long_url, :short_url, :id)
  end

  def log_ip_address
    ip = request.remote_ip
    @url.url_statistics.create(visit_ip_address: ip)
  end

end