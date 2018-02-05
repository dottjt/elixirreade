defmodule Portfolio.CoreTest do
  use Portfolio.DataCase

  alias Portfolio.Core

  describe "projects" do
    alias Portfolio.Core.Project

    @valid_attrs %{display_name: "some display_name", excerpt: "some excerpt", featured_image: "some featured_image", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", excerpt: "some updated excerpt", featured_image: "some updated featured_image", name: "some updated name"}
    @invalid_attrs %{display_name: nil, excerpt: nil, featured_image: nil, name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Core.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Core.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Core.create_project(@valid_attrs)
      assert project.display_name == "some display_name"
      assert project.excerpt == "some excerpt"
      assert project.featured_image == "some featured_image"
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Core.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.display_name == "some updated display_name"
      assert project.excerpt == "some updated excerpt"
      assert project.featured_image == "some updated featured_image"
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_project(project, @invalid_attrs)
      assert project == Core.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Core.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Core.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Core.change_project(project)
    end
  end

  describe "categories" do
    alias Portfolio.Core.Category

    @valid_attrs %{display_name: "some display_name", excerpt: "some excerpt", featured_image: "some featured_image", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", excerpt: "some updated excerpt", featured_image: "some updated featured_image", name: "some updated name"}
    @invalid_attrs %{display_name: nil, excerpt: nil, featured_image: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Core.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Core.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Core.create_category(@valid_attrs)
      assert category.display_name == "some display_name"
      assert category.excerpt == "some excerpt"
      assert category.featured_image == "some featured_image"
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Core.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.display_name == "some updated display_name"
      assert category.excerpt == "some updated excerpt"
      assert category.featured_image == "some updated featured_image"
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_category(category, @invalid_attrs)
      assert category == Core.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Core.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Core.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Core.change_category(category)
    end
  end

  describe "items" do
    alias Portfolio.Core.Item

    @valid_attrs %{display_name: "some display_name", excerpt: "some excerpt", featured_image: "some featured_image", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", excerpt: "some updated excerpt", featured_image: "some updated featured_image", name: "some updated name"}
    @invalid_attrs %{display_name: nil, excerpt: nil, featured_image: nil, name: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Core.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Core.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Core.create_item(@valid_attrs)
      assert item.display_name == "some display_name"
      assert item.excerpt == "some excerpt"
      assert item.featured_image == "some featured_image"
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Core.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.display_name == "some updated display_name"
      assert item.excerpt == "some updated excerpt"
      assert item.featured_image == "some updated featured_image"
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_item(item, @invalid_attrs)
      assert item == Core.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Core.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Core.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Core.change_item(item)
    end
  end

  describe "tags" do
    alias Portfolio.Core.Tag

    @valid_attrs %{display_name: "some display_name", excerpt: "some excerpt", featured_image: "some featured_image", name: "some name"}
    @update_attrs %{display_name: "some updated display_name", excerpt: "some updated excerpt", featured_image: "some updated featured_image", name: "some updated name"}
    @invalid_attrs %{display_name: nil, excerpt: nil, featured_image: nil, name: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Core.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Core.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Core.create_tag(@valid_attrs)
      assert tag.display_name == "some display_name"
      assert tag.excerpt == "some excerpt"
      assert tag.featured_image == "some featured_image"
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, tag} = Core.update_tag(tag, @update_attrs)
      assert %Tag{} = tag
      assert tag.display_name == "some updated display_name"
      assert tag.excerpt == "some updated excerpt"
      assert tag.featured_image == "some updated featured_image"
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_tag(tag, @invalid_attrs)
      assert tag == Core.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Core.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Core.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Core.change_tag(tag)
    end
  end
end
