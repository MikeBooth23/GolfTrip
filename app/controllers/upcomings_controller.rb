class UpcomingsController < ApplicationController
  def index
    matching_upcomings = Upcoming.all

    @list_of_upcomings = matching_upcomings.order({ :created_at => :desc })

    render({ :template => "upcomings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_upcomings = Upcoming.where({ :id => the_id })

    @the_upcoming = matching_upcomings.at(0)

    render({ :template => "upcomings/show.html.erb" })
  end

  def create
    the_upcoming = Upcoming.new
    the_upcoming.location = params.fetch("query_location")
    the_upcoming.image = params.fetch("query_image")
    the_upcoming.price_range = params.fetch("query_price_range")
    the_upcoming.votes = params.fetch("query_votes")

    if the_upcoming.valid?
      the_upcoming.save
      redirect_to("/upcomings", { :notice => "Upcoming created successfully." })
    else
      redirect_to("/upcomings", { :alert => the_upcoming.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_upcoming = Upcoming.where({ :id => the_id }).at(0)

    the_upcoming.location = params.fetch("query_location")
    the_upcoming.image = params.fetch("query_image")
    the_upcoming.price_range = params.fetch("query_price_range")
    the_upcoming.votes = params.fetch("query_votes")

    if the_upcoming.valid?
      the_upcoming.save
      redirect_to("/upcomings/#{the_upcoming.id}", { :notice => "Upcoming updated successfully."} )
    else
      redirect_to("/upcomings/#{the_upcoming.id}", { :alert => the_upcoming.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_upcoming = Upcoming.where({ :id => the_id }).at(0)

    the_upcoming.destroy

    redirect_to("/upcomings", { :notice => "Upcoming deleted successfully."} )
  end
end
