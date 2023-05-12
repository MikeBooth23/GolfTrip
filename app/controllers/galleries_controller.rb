class GalleriesController < ApplicationController
  def index
    matching_galleries = Gallery.all

    @list_of_galleries = matching_galleries.order({ :created_at => :desc })

    render({ :template => "galleries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_galleries = Gallery.where({ :id => the_id })

    @the_gallery = matching_galleries.at(0)

    render({ :template => "galleries/show.html.erb" })
  end

  def create
    the_gallery = Gallery.new
    the_gallery.trip = params.fetch("query_trip")
    the_gallery.image = params.fetch("query_image")
    the_gallery.description = params.fetch("query_description")
    the_gallery.votes = params.fetch("query_votes")

    if the_gallery.valid?
      the_gallery.save
      redirect_to("/galleries", { :notice => "Gallery created successfully." })
    else
      redirect_to("/galleries", { :alert => the_gallery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_gallery = Gallery.where({ :id => the_id }).at(0)

    the_gallery.trip = params.fetch("query_trip")
    the_gallery.image = params.fetch("query_image")
    the_gallery.description = params.fetch("query_description")
    the_gallery.votes = params.fetch("query_votes")

    if the_gallery.valid?
      the_gallery.save
      redirect_to("/galleries/#{the_gallery.id}", { :notice => "Gallery updated successfully."} )
    else
      redirect_to("/galleries/#{the_gallery.id}", { :alert => the_gallery.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_gallery = Gallery.where({ :id => the_id }).at(0)

    the_gallery.destroy

    redirect_to("/galleries", { :notice => "Gallery deleted successfully."} )
  end
end
