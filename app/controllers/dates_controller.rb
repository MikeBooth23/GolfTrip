class DateController < ApplicationController
  def index
    matching_date_votes = Date.all

    @list_of_dates = matching_dates.order({ :created_at => :desc })

    render({ :template => "date_votes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_date_votes = Date.where({ :id => the_id })

    @the_date = matching_date_votes.at(0)

    render({ :template => "date_votes/show.html.erb" })
  end

  def create_vote
    the_date = Date.new
    the_date.date = params.fetch("query_date")
    the_date.upvotes = 0
    the_date.downvotes = 0

    if the_date.valid?
      the_date.save
      redirect_to("/date_votes", { :notice => "Date vote created successfully." })
    else
      redirect_to("/date_votes", { :alert => the_date.errors.full_messages.to_sentence })
    end
  end

  def update_vote
    the_id = params.fetch("path_id")
    the_date = Date.where({ :id => the_id }).at(0)

    the_date.date = params.fetch("query_date")

    if the_date.valid?
      the_date.save
      redirect_to("/date_votes/#{the_date.id}", { :notice => "Date vote updated successfully."} )
    else
      redirect_to("/date_votes/#{the_date.id}", { :alert => the_date_.errors.full_messages.to_sentence })
    end
  end

  def destroy_vote
    the_id = params.fetch("path_id")
    the_date = Date.where({ :id => the_id }).at(0)

    the_date.destroy

    redirect_to("/date_votes", { :notice => "Date vote deleted successfully."} )
  end
end
