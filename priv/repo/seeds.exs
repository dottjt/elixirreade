# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Portfolio.Repo.insert!(%Portfolio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Portfolio.Repo
alias Portfolio.Core.Category
alias Portfolio.Coherence.User

# Coherence User

Repo.delete_all User

User.changeset(%User{}, %{name: "Julius Reade", email: "julius.reade@gmail.com", password: "hellothere", password_confirmation: "hellothere"})
    |> Repo.insert!




# Categories 

Repo.delete_all Category

programming = Ecto.Changeset.change(%Category{
    name: "programming",
    display_name: "Programming",
    description: "A list of the programming projects I've undertaken",
})

writing = Ecto.Changeset.change(%Category{
    name: "writing",
    display_name: "Writing",
    description: "A list of the writing projects I've undertaken",
})

youtube = Ecto.Changeset.change(%Category{
    name: "youtube",
    display_name: "Youtube",
    description: "A list of the youtube projects I've undertaken",
})

podcast = Ecto.Changeset.change(%Category{
    name: "podcast",
    display_name: "Podcast",
    description: "A list of the podcast projects I've undertaken",
})

radio = Ecto.Changeset.change(%Category{
    name: "radio",
    display_name: "Radio",
    description: "A list of the radio projects I've undertaken",
})



programming_with_projects = Ecto.Changeset.put_assoc(programming, :projects, [])
Repo.insert!(programming_with_projects)

writing_with_projects = Ecto.Changeset.put_assoc(writing, :projects, [])
Repo.insert!(writing_with_projects)

youtube_with_projects = Ecto.Changeset.put_assoc(youtube, :projects, [])
Repo.insert!(youtube_with_projects)

podcast_with_projects = Ecto.Changeset.put_assoc(podcast, :projects, [])
Repo.insert!(podcast_with_projects)

radio_with_projects = Ecto.Changeset.put_assoc(radio, :projects, [])
Repo.insert!(radio_with_projects)





