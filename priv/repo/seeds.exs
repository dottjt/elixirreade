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





# Categories 

programming = Ecto.Changeset.change(%Category{
    name: "programming",
    display_name: "Programming",
    description: "A list of the programming projects I've undertaken",
    icon: "blah",
})

writing = Ecto.Changeset.change(%Category{
    name: "writing",
    display_name: "Writing",
    description: "A list of the writing projects I've undertaken",
    icon: "blah",
})

youtube = Ecto.Changeset.change(%Category{
    name: "youtube",
    display_name: "Youtube",
    description: "A list of the youtube projects I've undertaken",
    icon: "blah",
})

podcast = Ecto.Changeset.change(%Category{
    name: "podcast",
    display_name: "Podcast",
    description: "A list of the podcast projects I've undertaken",
    icon: "blah",
})

radio = Ecto.Changeset.change(%Category{
    name: "radio",
    display_name: "Radio",
    description: "A list of the radio projects I've undertaken",
    icon: "blah",
})

Repo.insert!(programming)
Repo.insert!(writing)
Repo.insert!(youtube)
Repo.insert!(podcast)
Repo.insert!(radio)

