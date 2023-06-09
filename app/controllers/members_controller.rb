class MembersController < ApplicationController
  def index
    matching_members = Member.all

    @list_of_members = matching_members.order({ :created_at => :desc })

    render({ :template => "members/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_members = Member.where({ :id => the_id })

    @the_member = matching_members.at(0)

    render({ :template => "members/show.html.erb" })
  end

  def create
    the_member = Member.new
    the_member.name = params.fetch("query_name")
    the_member.nickname = params.fetch("query_nickname")
    the_member.hometown = params.fetch("query_hometown")
    the_member.bio = params.fetch("query_bio")
    the_member.image = params.fetch("query_image")

    if the_member.valid?
      the_member.save
      redirect_to("/members", { :notice => "Member created successfully." })
    else
      redirect_to("/members", { :alert => the_member.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.name = params.fetch("query_name")
    the_member.nickname = params.fetch("query_nickname")
    the_member.hometown = params.fetch("query_hometown")
    the_member.bio = params.fetch("query_bio")
    the_member.image = params.fetch("query_image")

    if the_member.valid?
      the_member.save
      redirect_to("/members/#{the_member.id}", { :notice => "Member updated successfully."} )
    else
      redirect_to("/members/#{the_member.id}", { :alert => the_member.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_member = Member.where({ :id => the_id }).at(0)

    the_member.destroy

    redirect_to("/members", { :notice => "Member deleted successfully."} )
  end
end
