defmodule PortfolioWeb.PageController do
  use PortfolioWeb, :controller

  alias Portfolio.Core

  def index(conn, _params) do
    categories_with_projects = Core.list_categories_with_projects()

    render conn, "index.html", categories_with_projects: categories_with_projects
  end

  def category(conn, %{"category" => category }) do
    case category do 
      "about" ->
        render conn, "about.html"

      "contact" ->
        render conn, "contact.html"  
      
      _ -> 
        render conn, "category.html"

    end 
  end


  def project(conn, %{"category" => category, "project" => project}) do
    project = get_project_name!(project)

    render conn, "project.html", project: project
  end

  

  def item(conn, %{"category" => category, "project" => project, "item" => item}) do
    item = get_item_name!(project)
    
    render conn, "item.html"
  end

end
