defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PortfolioWeb do
    pipe_through :browser # Use the default browser stack

    # generic routes

    get "/", PageController, :index
  
    get "/:category", PageController, :category 
    get "/:category/:project", PageController, :project 
    get "/:category/:project/:item", PageControlller :item 

  end

  scope "/admin", PortfolioWeb do 
    
    resources "/projects", ProjectController
    resources "/items", ItemController
    resources "/categories", CategoryController
    resources "/tags", TagController

  end

  # Other scopes may use custom stacks.
  # scope "/api", PortfolioWeb do
  #   pipe_through :api
  # end
end
