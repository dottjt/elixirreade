defmodule PortfolioWeb.PageController do
  use PortfolioWeb, :controller

  alias Portfolio.Core

  def homepage(conn, _params) do
    categories = Core.list_categories_with_projects()
    intro = Core.list_intro()

    render conn, "homepage.html", categories: categories, intro: intro
  end

  def about(conn, _params) do

    render conn, "about.html"
  end

  def contact(conn, _params) do

    render conn, "contact.html"
  end

  def projects(conn, _params) do
    categories = Core.list_categories_with_projects()
    
    render conn, "projects.html", categories: categories
  end

  def category(conn, %{"category" => category }) do
    category = Core.get_category_with_projects(category)

    render conn, "category.html", category: category
  end

  def project(conn, %{"category" => category, "project" => project}) do
    category = Core.get_category_with_projects(category)
    project = Core.get_project_name!(project)

    render conn, "project.html", category: category, project: project
  end

  def item(conn, %{"category" => category, "project" => project, "item" => item}) do
    item = Core.get_item_name!(project)
    
    render conn, "item.html"
  end

end
