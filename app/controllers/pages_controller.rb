class PagesController < ApplicationController
  Screencast = Struct.new(:name)

  def index
    @screencasts = []

    screencasts_dir.each do |filename|
      next if filename.in?(%w{. ..})
      @screencasts << Screencast.new(filename)
    end
  end

  private

  def screencasts_dir
    Dir.new(File.join("/Users/markchavez/Documents", "books-and-videos", "destroy-all-software"))
  end
end
