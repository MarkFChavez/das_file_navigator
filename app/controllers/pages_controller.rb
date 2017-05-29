class PagesController < ApplicationController
  def index
    @screencasts = []

    screencasts_dir.each do |filename|
      next if filename.in?(%w{. ..})
      path = get_file_for(filename)
      @screencasts << Screencast.new(filename, path)
    end

    if keyword.present?
      @screencasts.select! do |screencast|
        screencast.name.match(keyword)
      end
    end
  end

  private

  def keyword
    params[:keyword]
  end

  def screencasts_dir
    Dir.new(Rails.application.secrets.files_directory)
  end

  def get_file_for(filename)
    [Rails.application.secrets.files_directory, filename].join("/")
  end
end
