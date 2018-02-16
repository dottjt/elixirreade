defmodule Portfolio.Sitemaps do
    
  alias PortfolioWeb.Endpoint
  alias PortfolioWeb.Router.Helpers

  import Ecto.Query, warn: false
  alias Portfolio.Repo

  alias Portfolio.Core  
  alias Portfolio.Core.Project
  alias Portfolio.Core.Item
  alias Portfolio.Core.Category
 

  use Sitemap,
      host: "https://juliusreade.com",
      files_path: "priv/static/",
      public_path: "/",
      compress: false

  # Sitemap Functions 

  def list_category_names do
      Repo.all(from p in Category, order_by: [desc: p.inserted_at], select: p.name ) 
  end

  def list_project_names do
      Repo.all(from c in Project, order_by: [desc: c.inserted_at], select: c.name ) 
  end

  def list_item_names do
      Repo.all(from p in Item, order_by: [desc: p.inserted_at], select: p.name ) 
  end



  # Generate

  def generate do

      project_name_list = list_project_names()
      category_name_list = list_category_names()
      item_name_list = list_item_names()

      create do

          add Helpers.page_path(Endpoint, :homepage), priority: 0.5, changefreq: "daily", expires: nil
            
          if category_name_list do                                    
              Enum.map(category_name_list, fn(category_name) ->
                  add Helpers.page_path(Endpoint, :category, category_name), priority: 0.5, changefreq: "daily", expires: nil
                  
                  Enum.each(project_name_list, fn(project_name) ->
                    add Helpers.page_path(Endpoint, :project, category_name, project_name), priority: 0.5, changefreq: "daily", expires: nil                    

                    Enum.map(item_name_list, fn(item_name) ->
                      add Helpers.page_path(Endpoint, :item, category_name, project_name, item_name), priority: 0.5, changefreq: "daily", expires: nil
                    end)
                  end)
              end)
          end
          
      end
      IO.inspect "sitemap created"
      ping()
      
      # notify search engines (currently Google and Bing) of the updated sitemap
  end
end
