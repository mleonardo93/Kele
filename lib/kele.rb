require "httparty"
require "json"

class Kele
  include HTTParty

  def initialize(email, password)
    @credentials = {query: {email: email, password: password}}
    response = self.class.post("https://www.bloc.io/api/v1/sessions", @credentials)
    @token = response["auth_token"]
    @api_url = "https://www.bloc.io/api/v1"

    if @token == nil
      puts "Invalid credentials"
    end
  end

  def get_me
    response = self.class.get("https://www.bloc.io/api/v1/users/me", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end
end
