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
    Dir.new(dir_str)
  end

  def get_file_for(filename)
    File.join("/Users/markchavez/Documents", "books-and-videos", "destroy-all-software", filename)
  end

  def dir_str
    File.join("/Users/markchavez/Documents", "books-and-videos", "destroy-all-software")
  end
end
