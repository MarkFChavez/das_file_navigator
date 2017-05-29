class PagesController < ApplicationController
  def index
    dir = Dir.new(File.join("/Users/markchavez/Documents", "books-and-videos", "destroy-all-software"))
    @files = []

    dir.each do |f|
      unless f.in?(%w{. ..})
        @files << f
      end
    end
  end
end
