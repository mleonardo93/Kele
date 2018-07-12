require "httparty"
require "json"
require_relative "./roadmap"

class Kele
  include HTTParty
  include Roadmap

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

  def get_mentor_availability(mentor_id)
    response = self.class.get("https://www.bloc.io/api/v1/mentors/#{mentor_id]}/student_availability", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end
end
