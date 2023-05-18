class UpcomingsController < ApplicationController
  def index
    matching_upcomings = Upcoming.all

    @list_of_upcomings = matching_upcomings.order({ :created_at => :desc })

    matching_date_votes = DateVote.all

    @list_of_date_votes = matching_date_votes.order({ :created_at => :desc })

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
    the_upcoming.votes = 0

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

  def upvote
    id = params.fetch("location_id")
    the_upcoming = Upcoming.where({ :id => id}).at(0)
    
    the_upcoming.votes += 1
    the_upcoming.save

    redirect_to("/upcomings", { :notice => "Upvoted!"} )
  end

  def downvote
    id = params.fetch("location_id")
    the_upcoming = Upcoming.where({ :id => id}).at(0)
    
    the_upcoming.votes -= 1
    the_upcoming.save

    redirect_to("/upcomings", { :notice => "Downvoted"} )
  end

  def show_date
    the_id = params.fetch("path_id")

    matching_date_votes = DateVote.where({ :id => the_id })

    @the_date_vote = matching_date_votes.at(0)

    render({ :template => "date_votes/show.html.erb" })
  end

  def create_date
    the_date_vote = DateVote.new
    the_date_vote.date = params.fetch("query_date")
    the_date_vote.votes = 0

    if the_date_vote.valid?
      the_date_vote.save
      redirect_to("/upcomings", { :notice => "Date vote created successfully." })
    else
      redirect_to("/upcomings", { :alert => the_date_vote.errors.full_messages.to_sentence })
    end
  end

  def update_date
    the_id = params.fetch("path_id")
    the_date_vote = DateVote.where({ :id => the_id }).at(0)

    the_date_vote.date = params.fetch("query_date")
    the_date_vote.votes = params.fetch("query_votes")

    if the_date_vote.valid?
      the_date_vote.save
      redirect_to("/upcomings/#{the_date_vote.id}", { :notice => "Date vote updated successfully."} )
    else
      redirect_to("/upcomings/#{the_date_vote.id}", { :alert => the_date_vote.errors.full_messages.to_sentence })
    end
  end

  def destroy_date
    the_id = params.fetch("path_id")
    the_date_vote = DateVote.where({ :id => the_id }).at(0)

    the_date_vote.destroy

    redirect_to("/upcomings", { :notice => "Date vote deleted successfully."} )
  end

  def date_upvote
    id = params.fetch("date_id")
    the_date = DateVote.where({ :id => id}).at(0)
    
    the_date.votes += 1
    the_date.save

    redirect_to("/upcomings", { :notice => "Upvoted!"} )
  end

  def date_downvote
    id = params.fetch("date_id")
    the_date = DateVote.where({ :id => id}).at(0)
    
    the_date.votes -= 1
    the_date.save

    redirect_to("/upcomings", { :notice => "Downvoted"} )
  end

end
