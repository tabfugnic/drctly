module UrlsHelper
  def generated_link(key)
    "#{request.protocol}#{request.host_with_port}/#{key}"
  end
end
