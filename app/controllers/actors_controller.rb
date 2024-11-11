class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    # retrieve the user's inputs from params
    # params hash looks like this
    
      new_actor = Actor.new
      new_actor.name = params.fetch("the_name")
      new_actor.dob = params.fetch("the_dob")
      new_actor.bio = params.fetch("the_bio")
      new_actor.image = params.fetch("the_image")
    
      new_actor.save
      
      redirect_to("/actors")
    end 

    def destroy
      the_id = params.fetch("an_id")

      matching_records = Actor.where({ :id => the_id })
      the_movie = matching_records.at(0)
      the_movie.destroy

      redirect_to("/actors")
    end

    def update
      # get id out of params
      a_id = params.fetch("the_id")
      # find existing record
      matching_records = Actor.where({ :id => a_id })
      the_actor = matching_records.at(0)
      # overwrite column with the user's values
      the_actor.name = params.fetch("the_name")
      the_actor.dob = params.fetch("the_dob")
      the_actor.bio = params.fetch("the_bio")
      the_actor.image = params.fetch("the_image")
      # save
      the_movie.save
      # redirect to movies detail page
      redirect_to("/actors/#{the_actor.id}")
    end

end
