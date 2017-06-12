class BeersController < ApplicationController
  def index
    @beers = Beer.all

    render("beers/index.html.erb")
  end

  def show
    @beer = Beer.find(params[:id])

    render("beers/show.html.erb")
  end

  def new
    @beer = Beer.new

    render("beers/new.html.erb")
  end

  def create
    @beer = Beer.new

    @beer.category = params[:category]
    @beer.name.string = params[:name.string]
    @beer.user_id = params[:user_id]
    @beer.fellow_imbibers = params[:fellow_imbibers]
    @beer.favorite = params[:favorite]
    @beer.year = params[:year]
    @beer.rating = params[:rating]
    @beer.notes = params[:notes]
    @beer.grape = params[:grape]
    @beer.country = params[:country]
    @beer.photo = params[:photo]

    save_status = @beer.save

    if save_status == true
      redirect_to("/beers/#{@beer.id}", :notice => "Beer created successfully.")
    else
      render("beers/new.html.erb")
    end
  end

  def edit
    @beer = Beer.find(params[:id])

    render("beers/edit.html.erb")
  end

  def update
    @beer = Beer.find(params[:id])

    @beer.category = params[:category]
    @beer.name.string = params[:name.string]
    @beer.user_id = params[:user_id]
    @beer.fellow_imbibers = params[:fellow_imbibers]
    @beer.favorite = params[:favorite]
    @beer.year = params[:year]
    @beer.rating = params[:rating]
    @beer.notes = params[:notes]
    @beer.grape = params[:grape]
    @beer.country = params[:country]
    @beer.photo = params[:photo]

    save_status = @beer.save

    if save_status == true
      redirect_to("/beers/#{@beer.id}", :notice => "Beer updated successfully.")
    else
      render("beers/edit.html.erb")
    end
  end

  def destroy
    @beer = Beer.find(params[:id])

    @beer.destroy

    if URI(request.referer).path == "/beers/#{@beer.id}"
      redirect_to("/", :notice => "Beer deleted.")
    else
      redirect_to(:back, :notice => "Beer deleted.")
    end
  end
end
