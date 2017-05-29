class PagesController < ApplicationController

  Screencast = Struct.new(:name, :path) do
    def decorated_name
      name.gsub("-", " ")[9, name.length].capitalize
    end
  end

  def index
    @screencasts = []

    screencasts_dir.each do |filename|
      next if filename.in?(%w{. ..})
      path = get_file_for(filename)
      @screencasts << Screencast.new(filename, path)
    end
  end

  private

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
