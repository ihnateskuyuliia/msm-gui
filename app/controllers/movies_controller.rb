class MoviesController < ApplicationController

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    # retrieve the user's inputs from params
    # params hash looks like this: 
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}
    
      new_movie = Movie.all.new
      new_movie.title = params.fetch("the_title")
      new_movie.year = params.fetch("the_year")
      new_movie.duration = params.fetch("the_duration")
      new_movie.description = params.fetch("the_description")
      new_movie.image = params.fetch("the_image")
      new_movie.director_id = params.fetch("the_director_id")
    
      new_movie.save
      
      redirect_to("/movies")
    end 
    
    def destroy
      the_id = params.fetch("an_id")

      matching_records = Movie.where({ :id => the_id })
      the_movie = matching_records.at(0)
      the_movie.destroy

    end
end
