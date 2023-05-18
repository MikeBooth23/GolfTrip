class DateVotesController < ApplicationController
  def index
    matching_date_votes = DateVote.all

    @list_of_date_votes = matching_date_votes.order({ :created_at => :desc })

    render({ :template => "date_votes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_date_votes = DateVote.where({ :id => the_id })

    @the_date_vote = matching_date_votes.at(0)

    render({ :template => "date_votes/show.html.erb" })
  end

  def create_vote
    the_date_vote = DateVote.new
    the_date_vote.date = params.fetch("query_date")
    the_date_vote.votes = params.fetch("query_votes")

    if the_date_vote.valid?
      the_date_vote.save
      redirect_to("/date_votes", { :notice => "Date vote created successfully." })
    else
      redirect_to("/date_votes", { :alert => the_date_vote.errors.full_messages.to_sentence })
    end
  end

  def update_vote
    the_id = params.fetch("path_id")
    the_date_vote = DateVote.where({ :id => the_id }).at(0)

    the_date_vote.date = params.fetch("query_date")
    the_date_vote.votes = params.fetch("query_votes")

    if the_date_vote.valid?
      the_date_vote.save
      redirect_to("/date_votes/#{the_date_vote.id}", { :notice => "Date vote updated successfully."} )
    else
      redirect_to("/date_votes/#{the_date_vote.id}", { :alert => the_date_vote.errors.full_messages.to_sentence })
    end
  end

  def destroy_vote
    the_id = params.fetch("path_id")
    the_date_vote = DateVote.where({ :id => the_id }).at(0)

    the_date_vote.destroy

    redirect_to("/date_votes", { :notice => "Date vote deleted successfully."} )
  end
end
