class HomeController < ApplicationController
  def index
    # Render the home page with a welcome message
    @message = "Welcome to the Home Page!"
    
    # You can add more instance variables or logic here as needed
    # For example, fetching some data from the database or an API
    # @items = Item.all # Example of fetching all items from the database
    # Render the index view
    render :index
  end
end
