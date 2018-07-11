module Roadmap
  def get_roadmap
    response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{self.get_me["current_enrollment"]["chain_id"]}", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end

  def get_checkpoint(id)
    response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{id}", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end
end