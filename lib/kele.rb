require "httparty"

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
end
