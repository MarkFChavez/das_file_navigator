Screencast = Struct.new(:name, :path) do
  def decorated_name
    name.gsub("-", " ")[9, name.length].split(".").first.capitalize
  end
end

