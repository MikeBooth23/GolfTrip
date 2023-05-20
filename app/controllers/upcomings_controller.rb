class UpcomingsController < ApplicationController
  def index
    matching_upcomings = Upcoming.all

    @list_of_upcomings = matching_upcomings.order({ :created_at => :desc })

    matching_date_votes = Datetable.all

    @list_of_dates = matching_date_votes.order({ :created_at => :desc })

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
    the_upcoming.upvote = 0
    the_upcoming.downvote = 0

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
    vote = LocationVote.new
    id = params.fetch("location_id")
    vote.location_id = id
    vote.user_id = session.fetch("user_id")
    vote.upvotes = 1
    vote.save
    # id = params.fetch("location_id")
    the_upcoming = Upcoming.where({ :id => id}).at(0)
    
    the_upcoming.upvote = LocationVote.all.where({:location_id => id}).sum(:upvotes)
    the_upcoming.save

    redirect_to("/upcomings", { :notice => "Upvoted!"} )
  end

  def undo_upvote
    the_id = params.fetch("location_id")
    the_upvote = LocationVote.where({ :location_id => the_id }).where({:user_id => session.fetch("user_id")}).where({:upvotes => 1}).at(0)

    the_upvote.upvotes=0
    the_upvote.save

    the_upcoming = Upcoming.where({ :id => the_id}).at(0)

    the_upcoming.upvote = LocationVote.all.where({:location_id => the_id}).sum(:upvotes)
    the_upcoming.save

    redirect_to("/upcomings", { :notice => "You removed your upvote!"} )
  end

  def downvote
    vote = LocationVote.new
    id = params.fetch("location_id")
    vote.location_id = id
    vote.user_id = session.fetch("user_id")
    vote.downvotes = 1
    vote.save
    # id = params.fetch("location_id")
    the_upcoming = Upcoming.where({ :id => id}).at(0)
    
    the_upcoming.downvote = LocationVote.all.where({:location_id => id}).sum(:downvotes)
    the_upcoming.save

    redirect_to("/upcomings", { :notice => "Downvoted"} )
  end

  def undo_downvote
    the_id = params.fetch("location_id")
    the_downvote = LocationVote.where({ :location_id => the_id }).where({:user_id => session.fetch("user_id")}).where({:downvotes => 1}).at(0)

    the_downvote.downvotes=0
    the_downvote.save

    the_upcoming = Upcoming.where({ :id => the_id}).at(0)

    the_upcoming.downvote = LocationVote.all.where({:location_id => the_id}).sum(:downvotes)
    the_upcoming.save

    redirect_to("/upcomings", { :notice => "You removed your downvote!"} )
  end

  def show_date
    the_id = params.fetch("path_id")

    matching_date_votes = Datetable.where({ :id => the_id })

    @the_date_vote = matching_date_votes.at(0)

    render({ :template => "date_votes/show.html.erb" })
  end

  def create_date
    require 'date'
    the_date = Datetable.new
    the_date.date = params.fetch("query_date")
    the_date.upvotes = 0
    the_date.downvotes = 0

    if the_date.valid?
      the_date.save
      redirect_to("/upcomings", { :notice => "Date vote created successfully." })
    else
      redirect_to("/upcomings", { :alert => the_date.errors.full_messages.to_sentence })
    end
  end

  def update_date
    the_id = params.fetch("path_id")
    the_date_vote = Datetable.where({ :id => the_id }).at(0)

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
    the_date_vote = Datetable.where({ :id => the_id }).at(0)

    the_date_vote.destroy

    redirect_to("/upcomings", { :notice => "Date vote deleted successfully."} )
  end

  def date_upvote
    vote = DateVote.new
    id = params.fetch("date_id")
    vote.date_id = id
    vote.user_id = session.fetch("user_id")
    vote.upvotes = 1
    vote.save


    the_date = Datetable.where({ :id => id}).at(0)

    the_date.upvotes = DateVote.all.where({:date_id => id}).sum(:upvotes)
    the_date.save

    redirect_to("/upcomings", { :notice => "Upvoted!"} )
  end

  def undo_date_upvote
    the_id = params.fetch("date_id")
    the_upvote = DateVote.where({ :date_id => the_id }).where({:user_id => session.fetch("user_id")}).where({:upvotes => 1}).at(0)

    the_upvote.upvotes=0
    the_upvote.save

    the_date = Datetable.where({ :id => the_id}).at(0)

    the_date.upvotes = DateVote.all.where({:date_id => the_id}).sum(:upvotes)
    the_date.save

    redirect_to("/upcomings", { :notice => "You removed your upvote!"} )
  end

  def date_downvote
    vote = DateVote.new
    id = params.fetch("date_id")
    vote.date_id = id
    vote.user_id = session.fetch("user_id")
    vote.downvotes = 1
    vote.save


    the_date = Datetable.where({ :id => id}).at(0)

    the_date.downvotes = DateVote.all.where({:date_id => id}).sum(:downvotes)
    the_date.save

    redirect_to("/upcomings", { :notice => "Downvoted"} )
  end

  def undo_date_downvote
    the_id = params.fetch("date_id")
    the_upvote = DateVote.where({ :date_id => the_id }).where({:user_id => session.fetch("user_id")}).where({:downvotes => 1}).at(0)

    the_upvote.downvotes=0
    the_upvote.save

    the_date = Datetable.where({ :id => the_id}).at(0)

    the_date.downvotes = DateVote.all.where({:date_id => the_id}).sum(:downvotes)
    the_date.save

    redirect_to("/upcomings", { :notice => "You removed your upvote!"} )
  end

  def date_comment
    the_comment = DateComment.new
    the_comment.trip_date_id = params.fetch("path_id")
    the_comment.body = params.fetch("query_body")
    the_comment.author_id = session.fetch(:user_id)
    
    if the_comment.valid?
      the_comment.save
      redirect_to("/date_votes/#{the_comment.trip_date_id}", { :notice => "Gallery created successfully." })
    else
      redirect_to("/date_votes/#{the_comment.trip_date_id}", { :alert => the_gallery.errors.full_messages.to_sentence })
    end

  end

end
