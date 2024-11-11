class ActorsController < ApplicationController
 
  def update
    the_id = params.fetch("an_id")
    matching_records = Actor.where({:id => the_id})
    the_actor = matching_records.at(0)
  
    the_actor.name = params.fetch("query_name")
    the_actor.dob = params.fetch("query_dob")
    the_actor.bio = params.fetch("query_bio")
    the_movie.image = params.fetch("query_image")
  
    the_actor.save
  
    redirect_to("/actors/#{the_actor.id}")

    end 
  
    def destroy
      the_id = params.fetch("an_id")
  
      matching_records = Actor.where({ :id => the_id })
      the_actor = matching_records.at(0)
      if the_actor
        the_actor.destroy
        redirect_to("/actors")
      else
        redirect_to("/actors", alert: "Actor not found.")
      end
    end

  def create
    #   "query_name"=>"Actor", "query_dob"=>"", "query_bio"=>"", "query_image"=>"", "controller"=>"actors", "action"=>"create"}   
       a = Actor.new
       a.name = params.fetch("query_name")
       a.dob = params.fetch("query_dob")
       a.bio = params.fetch("query_bio")
       a.image = params.fetch("query_image")
      
       a.save
   
       redirect_to("/actors")
   
     end


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
end
