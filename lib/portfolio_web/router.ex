defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router
  use Coherence.Router
  use ExAdmin.Router

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


  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/", PortfolioWeb do
    get "/", PageController, :homepage
    get "/hire", PageController, :hire    
    get "/about", PageController, :about
    get "/contact", PageController, :contact
    get "/projects", PageController, :projects

    get "/projects/:category", PageController, :category 
    get "/projects/:category/:project", PageController, :project 
    get "/projects/:category/:project/:item", PageControlller, :item 
    
    # index

  end


  scope "/admin" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/admin", ExAdmin do
    pipe_through :protected
    admin_routes()
  end

  scope "/admin", PortfolioWeb do 
    resources "/items", ItemController
    resources "/projects", ProjectController
    resources "/categories", CategoryController
    resources "/tags", TagController
  end

end
