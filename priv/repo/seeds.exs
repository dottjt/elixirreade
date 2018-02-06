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
alias Portfolio.Core.Project
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






# Categories - Programming

awful_cms = Ecto.Changeset.change(%Project{
    name: "awful-cms",
    display_name: "Awful CMS",
    excerpt: "The automated structure that brings Awful Manager and Awful Affiliate together.",
    description: ".",
    featured_image: ""
})

awful_manager = Ecto.Changeset.change(%Project{
    name: "awful-manager",
    display_name: "Awful Manager",
    excerpt: "An online platform that manages all the Awful Affiliate websites.",
    description: ".",
    featured_image: ""
})

awful_affiliate = Ecto.Changeset.change(%Project{
    name: "awful-affiliate",
    display_name: "Awful Affiliate",
    excerpt: "The Awful Affiliate website. This wonderful brand I've created.",
    description: ".",
    featured_image: ""
})

better_image_reference = Ecto.Changeset.change(%Project{
    name: "better-image-reference",
    display_name: "Better Image Reference",
    excerpt: "An online image reference application.",
    description: ".",
    featured_image: ""
})

learning_schedule = Ecto.Changeset.change(%Project{
    name: "learning-schedule",
    display_name: "Learning Schedule",
    excerpt: "My very first full-stack application!",
    description: ".",
    featured_image: ""
})





programming_with_projects = Ecto.Changeset.put_assoc(programming, :projects, 
[awful_cms, awful_manager, awful_affiliate, better_image_reference])
Repo.insert!(programming_with_projects)




# Categories - Writing

juliusreadecom = Ecto.Changeset.change(%Project{
    name: "juliusreade",
    display_name: "Julius Reade V1",
    excerpt: "Personal website.",
    description: ".",
    featured_image: ""
})

medium = Ecto.Changeset.change(%Project{
    name: "medium",
    display_name: "Medium",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

perspectivetheory = Ecto.Changeset.change(%Project{
    name: "perspective-theory",
    display_name: "Perspective Theory",
    excerpt: "A mental health website I created.",
    description: "So, I used to have a lot of mental health issues. And I thought to myself, well, if I write about them then I . Nup. Doesn't work one bit.",
    featured_image: ""
})

elegantlyattached = Ecto.Changeset.change(%Project{
    name: "elegantlyattached",
    display_name: "Elegantly Attached",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

brokenheartsandfracturedsmiles = Ecto.Changeset.change(%Project{
    name: "broken-hearts-and-fractured-smiles",
    display_name: "Broken Hearts and Fractured Smiles",
    excerpt: "Personal blog of sorts.",
    description: ".",
    featured_image: ""
})

blackwhiteinkcurves = Ecto.Changeset.change(%Project{
    name: "black-white-ink-curves",
    display_name: "Black White Ink Curves",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

sweetcherryerotica = Ecto.Changeset.change(%Project{
    name: "sweetcherryerotica",
    display_name: "Sweet Cherry Erotica",
    excerpt: "It wasn't too bad.",
    description: ".",
    featured_image: ""
})

tktxtktx = Ecto.Changeset.change(%Project{
    name: "tktxtktx",
    display_name: "tktxtktx",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

adelaidesucks = Ecto.Changeset.change(%Project{
    name: "adelaidesucks",
    display_name: "adelaidesucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

melbournesucks = Ecto.Changeset.change(%Project{
    name: "melbournesucks",
    display_name: "melbournesucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

sydneysucks = Ecto.Changeset.change(%Project{
    name: "sydneysucks",
    display_name: "sydneysucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

perthsucks = Ecto.Changeset.change(%Project{
    name: "perthsucks",
    display_name: "perthsucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

hobartsucks = Ecto.Changeset.change(%Project{
    name: "hobartsucks",
    display_name: "hobartsucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})



writing_with_projects = Ecto.Changeset.put_assoc(writing, :projects, 
[juliusreadecom, medium, perspectivetheory, elegantlyattached, 
brokenheartsandfracturedsmiles, blackwhiteinkcurves, sweetcherryerotica, 
tktxtktx, adelaidesucks, melbournesucks, sydneysucks, perthsucks, hobartsucks])
Repo.insert!(writing_with_projects)


# Categories - YouTube

financialreality2011 = Ecto.Changeset.change(%Project{
    name: "The Financial Reality 2011",
    display_name: "tktxtktx",
    excerpt: "Financial YouTube Channel.",
    description: ".",
    featured_image: ""
})

financialreality201213 = Ecto.Changeset.change(%Project{
    name: "The Financial Reality 2012/13",
    display_name: "tktxtktx",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})

financialreality201516 = Ecto.Changeset.change(%Project{
    name: "The Financial Reality 2015/16",
    display_name: "tktxtktx",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})


youtube_with_projects = Ecto.Changeset.put_assoc(youtube, :projects, 
[financialreality2011, financialreality201213, financialreality201516])
Repo.insert!(youtube_with_projects)


# Categories - Podcast


zerohedge = Ecto.Changeset.change(%Project{
    name: "the-zerohedge-daily-roundup",
    display_name: "The Zerohedge Daily Roundup",
    excerpt: "A podcast I did summarising all the latest news stories on Zero Hedge.",
    description: ".",
    featured_image: ""
})


drudgereportreport = Ecto.Changeset.change(%Project{
    name: "drudge-report-report",
    display_name: "The Drudge Report Report",
    excerpt: "A podcast I did summarising all the latest news stories on Zero Hedge.",
    description: ".",
    featured_image: ""
})

wetalkyoudie = Ecto.Changeset.change(%Project{
    name: "we-talk-you-die",
    display_name: "We Talk, You Die",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: ""
})



podcast_with_projects = Ecto.Changeset.put_assoc(podcast, :projects, 
[])
Repo.insert!(podcast_with_projects)


# Categories - Radio

radio_with_projects = Ecto.Changeset.put_assoc(radio, :projects, [])
Repo.insert!(radio_with_projects)





