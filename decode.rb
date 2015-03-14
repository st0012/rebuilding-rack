class Code
  def initialize(code)
    @code = code
  end

  def decode
    keep_url.map do |url|
      if match_data = url.match(/[0-9]{2,3}x[0-9]{2,3}/)
        Hash[match_data[0].split("x").first, url]
      else
        Hash["full", url]
      end
    end
  end

  def keep_url
    @code.split(";").map do |string|
      string.split('"').delete_if {|s| s.match("http").nil? }
    end.flatten
  end
end