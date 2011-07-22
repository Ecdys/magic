class PagesController < ApplicationController
  def home
  end

  def help
  end
  
  def proxy
    url = URI.parse(params[:url])
    
    req = Net::HTTP::Get.new(url.path + '?' + params[:params])
    resp = Net::HTTP.start(url.host, url.port){|http|
      http.request(req)
    }
    
    response.headers["Content-Type"] = params[:type]
    
    render :text => resp.body
  end

end
