module Roadmap
  def get_roadmap(chain_id)
    response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{chain_id}", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end

  def get_checkpoint(id)
    response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{id}", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end

  def get_remaining_checkpoints(chain_id)
    response = self.class.get("https://www.bloc.io/api/v1/enrollment_chains/#{chain_id}/checkpoints_remaining_in_section", headers: {"authorization" => @token})
    JSON.parse(response.body)
  end
end