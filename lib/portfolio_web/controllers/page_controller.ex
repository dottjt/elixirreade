defmodule PortfolioWeb.PageController do
  use PortfolioWeb, :controller

  alias Portfolio.Core

  def homepage(conn, _params) do
    categories = Core.list_categories_with_projects()
    intro = Core.list_intro()

    meta_title = "Julius Reade"
    meta_description = "Software Developer, Melbourne, Australia. This is a personal portfolio of all the stuff I've made. Hopefully you will discover a broken man."

    render conn, "homepage.html", categories: categories, intro: intro, meta_description: meta_description, meta_title: meta_title
  end

  def hire(conn, _params) do

    meta_title = "Julius Reade | Hire"
    meta_description = "I am available to hire as a programmer." 

    render conn, "hire.html", meta_description: meta_description, meta_title: meta_title
  end

  def about(conn, _params) do

    meta_title = "Julius Reade | About"
    meta_description = "Learn more about what makes me tick."

    render conn, "about.html", meta_description: meta_description, meta_title: meta_title
  end

  def contact(conn, _params) do

    meta_title = "Julius Reade | Contact"
    meta_description = "Say hello."

    render conn, "contact.html", meta_description: meta_description, meta_title: meta_title
  end

  def projects(conn, _params) do
    categories = Core.list_categories_with_projects()
    
    meta_title = "Julius Reade | Projects " 
    meta_description = "A list of all my projects."

    render conn, "projects.html", categories: categories, meta_description: meta_description, meta_title: meta_title
  end

  def category(conn, %{"category" => category }) do
    category = Core.get_category_with_projects(category)

    meta_title = "Julius Reade | " <> category.display_name
    meta_description = "A list of all my " <> category.display_name <> " projects."

    render conn, "category.html", category: category, meta_description: meta_description, meta_title: meta_title
  end

  def project(conn, %{"category" => category, "project" => project}) do
    category = Core.get_category_with_projects(category)
    project = Core.get_project_name!(project)

    meta_title = "Julius Reade | " <> project.display_name
    meta_description = project.description

    render conn, "project.html", category: category, project: project, meta_description: meta_description, meta_title: meta_title
  end

  def item(conn, %{"category" => category, "project" => project, "item" => item}) do
    item = Core.get_item_name!(project)
    
    meta_title = "Julius Reade | " <> item.display_name
    meta_description = item.excerpt

    render conn, "item.html", meta_description: meta_description, meta_title: meta_title
  end

end
