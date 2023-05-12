class HistoricalsController < ApplicationController
  def index
    matching_historicals = Historical.all

    @list_of_historicals = matching_historicals.order({ :created_at => :desc })

    render({ :template => "historicals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_historicals = Historical.where({ :id => the_id })

    @the_historical = matching_historicals.at(0)

    render({ :template => "historicals/show.html.erb" })
  end

  def create
    the_historical = Historical.new
    the_historical.date = params.fetch("query_date")
    the_historical.winning_team = params.fetch("query_winning_team")
    the_historical.losing_team = params.fetch("query_losing_team")
    the_historical.punishment = params.fetch("query_punishment")

    if the_historical.valid?
      the_historical.save
      redirect_to("/historicals", { :notice => "Historical created successfully." })
    else
      redirect_to("/historicals", { :alert => the_historical.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_historical = Historical.where({ :id => the_id }).at(0)

    the_historical.date = params.fetch("query_date")
    the_historical.winning_team = params.fetch("query_winning_team")
    the_historical.losing_team = params.fetch("query_losing_team")
    the_historical.punishment = params.fetch("query_punishment")

    if the_historical.valid?
      the_historical.save
      redirect_to("/historicals/#{the_historical.id}", { :notice => "Historical updated successfully."} )
    else
      redirect_to("/historicals/#{the_historical.id}", { :alert => the_historical.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_historical = Historical.where({ :id => the_id }).at(0)

    the_historical.destroy

    redirect_to("/historicals", { :notice => "Historical deleted successfully."} )
  end
end
