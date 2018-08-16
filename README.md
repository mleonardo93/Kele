# Kele
Ruby gem that interfaces with the Bloc API.

## User Stories
### As a user, I want to initialize and authorize Kele with a Bloc username and password
For this user story, I POSTed a JSON object containing the user's email and password with HTTParty in the `initialize` method. 
### As a user, I want to retrieve the current user as a JSON blob
Here, I request the info of the current user and retreive it as a JSON object in the `get_me` method. 
### As a user, I want to retrieve a list of my mentor's availability
In this user story, I pass a `mentor_id` as an argument to the `get_mentor_availability` method and send a HTTP request to the Bloc API, parsing the received JSON into a hash.
### As a user, I want to retrieve roadmaps and checkpoints
A separate module, `roadmap.rb`, contains two methods, `get_roadmap` and `get_checkpoint`, to retreive JSON objects containing information on program roadmaps and individual checkpoints, respectively. The first method, `get_roadmap`, takes one argument, `chain_id`, which can be found in the output of `get_me`. The second method, `get_checkpoint`, requires an `id` argument, the value of which can be found in the response to `get_roadmap`.
### As a user, I want to retrieve a list of my messages, respond to an existing message, and create a new message thread
Back to the main module, `kele.rb`, for this user story. The `get_messages` method takes one argument, `page`, and returns messages received on the Bloc platform in a hash. The `create_message` method takes arguments for sender email, Bloc ID of recipient, a subject line, and the body text of the message. 
### As a user, I want to retrieve a list of checkpoints remaining in my current section
The fulfillment of this user story uses the last method in `roadmap.rb`, `get_remaining_checkpoints`. It takes the same `chain_id` argument as `get_roadmap`, and it shows the checkpoints remaining in the current roadmap. 

## What I learned
I learned to create a Ruby gem. I learned about authorization with JSON web tokens. I gained knowledge of applications for an API client and how to update resources via API. With the knowledge I gained in this project, I feel a lot more comfortable building applications to interact with other existing applications. 
