class UrlsController < ApplicationController

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def index
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)
    @url.key = SecureRandom.urlsafe_base64(6)
    @url.save
    redirect_to @url, notice: 'Url was successfully created.'
  end

  def direct
    @url = Url.where(key: params[:code]).first
    @url = Url.find_by(key: params[:code])
    redirect_to @url.link
  end

  private

  def url_params
    params.require(:url).permit(:link)
  end
end
