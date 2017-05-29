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
        screencast.decorated_name.downcase.match(keyword.downcase)
      end
    end
  end

  private

  def keyword
    params[:keyword]
  end

  def screencasts_dir
    Dir.new(files_directory)
  end

  def get_file_for(filename)
    [files_directory, filename].join("/")
  end

  def files_directory
    Rails.application.secrets.files_directory
  end
end
