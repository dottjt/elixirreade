defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true 
  end


  # pipeline :api do
  #   plug :accepts, ["json"]
  # end


  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/", PortfolioWeb do
    get "/", PageController, :homepage
  
    get "/:category", PageController, :category 
    get "/:category/:project", PageController, :project 
    get "/:category/:project/:item", PageControlller, :item 

  end


  scope "/admin" do
    pipe_through :protected
    coherence_routes :protected
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
