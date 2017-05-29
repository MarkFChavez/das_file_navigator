class ScreencastsController < ApplicationController
  def show
    @screencast = screencast
    eval("`open #{screencast.path}`")

    redirect_to root_url
  end

  private

  def screencast
    Screencast.new(params[:name], params[:path])
  end
end

