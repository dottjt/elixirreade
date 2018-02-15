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
Repo.delete_all Category
Repo.delete_all Project

User.changeset(%User{}, %{name: "Julius Reade", email: "julius.reade@gmail.com", password: "hellothere", password_confirmation: "hellothere"})
    |> Repo.insert!




# Categories

programming = Ecto.Changeset.change(%Category{
    name: "programming",
    display_name: "Programming",
    description: "What I spend most my time doing.",
})

writing = Ecto.Changeset.change(%Category{
    name: "writing",
    display_name: "Writing",
    description: "Delicious.",
})

youtube = Ecto.Changeset.change(%Category{
    name: "youtube",
    display_name: "Youtube",
    description: "Growing up I very desperately wanted to be a YouTube star.",
})

podcast = Ecto.Changeset.change(%Category{
    name: "podcast",
    display_name: "Podcast",
    description: "I used to create podcasts with my eyes.",
})

radio = Ecto.Changeset.change(%Category{
    name: "radio",
    display_name: "Radio",
    description: "I also wanted to work in radio and become a shock-jock.",
})






# Categories - Programming

awful_cms = Ecto.Changeset.change(%Project{
    name: "awful-cms",
    display_name: "Awful CMS",
    excerpt: "The automated structure that brings Awful Manager and Awful Affiliate together.",
    description: "I would describe Awful CMS as a combination of the 8,000 billion bash scripts that 
    helps power Awful Manager to generate my collection of Awful Affiliate websites. It has scripts to 
    destroy, create and update these websites from a cache of files, both in production
    and development environments It's really cool.
    ",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: [],
})

awful_manager = Ecto.Changeset.change(%Project{
    name: "awful-manager",
    display_name: "Awful Manager",
    excerpt: "An online platform that manages all the Awful Affiliate websites.",
    description: "This piece of software is an absolute beast. It is basically the GUI backend for
    Awful CMS. It allows me to update the content of all my Awful Affiliate websites from the one domain, 
    as well as easily manage production and development environments. Not to mention, 
    it's fully navigable via keyboard and does a whole heap of things!    
    ",
    featured_image: "",
    background_image: "images/cool/coolb.jpg",
    link: "",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: [],
})

awful_affiliate = Ecto.Changeset.change(%Project{
    name: "awful-affiliate",
    display_name: "Awful Affiliate",
    excerpt: "The Awful Affiliate website. This wonderful brand I've created.",
    description: "Awful Affiliate is the website template I use for all my affiliate websites.
    It is a fully functioning Phoenix Framework application, allowing you 
    to create products, updates, tags, categories - and whatever the hell you want. 
    ",
    featured_image: "",
    background_image: "images/cool/coolc.jpg",
    link: "",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: [],
})

better_image_reference = Ecto.Changeset.change(%Project{
    name: "better-image-reference",
    display_name: "Better Image Reference",
    excerpt: "An online image reference application.",
    description: "This is the first serious application I created with Elixir and Elm.
    It was going to be a very comprehensive image viewer for students learning to draw. 
    Actually, I never ended up finishing it, because I realised that it wouldn't make very much money
    (hence Awful Affiliate which I created soon after).
    ",
    featured_image: "",
    background_image: "images/cool/coold.jpg",
    link: "",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2017-01-01 23:00:07],
    tags: [],
})

learning_schedule = Ecto.Changeset.change(%Project{
    name: "learning-schedule",
    display_name: "Learning Schedule",
    excerpt: "My very first full-stack application!",
    description: "I had literally zero idea what I was doing - however, it does quite a lot and it was an 
    incredible learning experience.
    ",
    featured_image: "Learning Schedule was the very first full-stack application I ever built!",
    background_image: "images/cool/coole.jpg",
    link: "",
    start_date: ~N[2016-01-01 23:00:07],
    end_date: ~N[2017-01-01 23:00:07],
    tags: [],
})

juliusreadev2 = Ecto.Changeset.change(%Project{
  name: "julius-reade-version-one",
  display_name: "Personal Website",
  excerpt: "The current version of the website built with",
  description: "The very first version of this portfolio website. Well, it wasn't
  so much of a portfolio website, rather than a minimalist personal blog I slapped together.
  Still, I thought it looked lovely.  
  ",
  featured_image: "",
  background_image: "images/cool/coolf.jpg",
  link: "",
  start_date: ~N[2016-01-01 23:00:07],
  end_date: ~N[2016-01-01 23:00:07],
  tags: [],
})

juliusreadev1 = Ecto.Changeset.change(%Project{
  name: "julius-reade-version-two",
  display_name: "Personal Website",
  excerpt: "The first version of the website built with Hugo.",
  description: "This is the website you're currently looking at. It's built with Phoenix Framework 
  (originally it was going to be with ASP.NET Core, but I believe in self-love) and 
  I think it looks nice. 
  ",
  featured_image: "",
  background_image: "images/cool/coolg.jpg",
  link: "",
  start_date: ~N[2018-01-01 23:00:07],
  end_date: ~N[2018-01-01 23:00:07],
  tags: [],
})




programming_with_projects = Ecto.Changeset.put_assoc(programming, :projects, 
[awful_cms, awful_manager, awful_affiliate, better_image_reference, learning_schedule, juliusreadev2, juliusreadev1])

Repo.insert!(programming_with_projects)




# Categories - Writing

juliusreadecom = Ecto.Changeset.change(%Project{
    name: "juliusreade",
    display_name: "Julius Reade V1",
    excerpt: "Personal website.",
    description: "Before my website became *this* it was a blog containing all of the 
    content you see here today.
    ",
    featured_image: "",
    background_image: "images/cool/cool1.jpg",
    link: "",
    start_date: ~N[2016-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: []
})

medium = Ecto.Changeset.change(%Project{
    name: "medium",
    display_name: "Medium",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/cool2.jpg",
    link: "",
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2017-01-01 23:00:07],
    tags: []
})

perspectivetheory = Ecto.Changeset.change(%Project{
    name: "perspective-theory",
    display_name: "Perspective Theory",
    excerpt: "A mental health website I created.",
    description: "So, I used to have a lot of mental health issues. And I thought to myself, well, if I write about them then I . Nup. Doesn't work one bit.",
    featured_image: "",
    background_image: "images/cool/coola1.jpg",
    link: "",
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2015-01-01 23:00:07],
    tags: []
})

elegantlyattached = Ecto.Changeset.change(%Project{
    name: "elegantlyattached",
    display_name: "Elegantly Attached",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola2.jpg",
    link: "",
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2015-01-01 23:00:07],
    tags: []
})

brokenheartsandfracturedsmiles = Ecto.Changeset.change(%Project{
    name: "broken-hearts-and-fractured-smiles",
    display_name: "Broken Hearts and Fractured Smiles",
    excerpt: "Personal blog of sorts.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola3.jpg",
    link: "",
    start_date: ~N[2014-01-01 23:00:07],
    end_date: ~N[2015-01-01 23:00:07],
    tags: []
})

blackwhiteinkcurves = Ecto.Changeset.change(%Project{
    name: "black-white-ink-curves",
    display_name: "Black White Ink Curves",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola4.jpg",
    link: "",
    start_date: ~N[2014-01-01 23:00:07],
    end_date: ~N[2014-01-01 23:00:07],
    tags: []
})

sweetcherryerotica = Ecto.Changeset.change(%Project{
    name: "sweetcherryerotica",
    display_name: "Sweet Cherry Erotica",
    excerpt: "It wasn't too bad.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola5.jpg",
    link: "",
    start_date: ~N[2014-01-01 23:00:07],
    end_date: ~N[2014-01-01 23:00:07],
    tags: []
})

tktxtktx = Ecto.Changeset.change(%Project{
    name: "tktxtktx",
    display_name: "tktxtktx",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coolb1.jpg",
    link: "",
    start_date: ~N[2013-01-01 23:00:07],
    end_date: ~N[2013-01-01 23:00:07],
    tags: []
})


inkquotes = Ecto.Changeset.change(%Project{
  name: "inkquotes",
  display_name: "Ink Quotes",
  excerpt: "A bunch of personal posts and creative writing.",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coolb2.jpg",
  link: "",
  start_date: ~N[2013-01-01 23:00:07],
  end_date: ~N[2013-01-01 23:00:07],
  tags: []
})


adelaidesucks = Ecto.Changeset.change(%Project{
    name: "adelaidesucks",
    display_name: "adelaidesucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2008-01-01 23:00:07],
    end_date: ~N[2008-01-01 23:00:07],
    tags: []
})

melbournesucks = Ecto.Changeset.change(%Project{
    name: "melbournesucks",
    display_name: "melbournesucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2009-01-01 23:00:07],
    end_date: ~N[2009-01-01 23:00:07],
    tags: []
})

sydneysucks = Ecto.Changeset.change(%Project{
    name: "sydneysucks",
    display_name: "sydneysucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2009-01-01 23:00:07],
    end_date: ~N[2009-01-01 23:00:07],
    tags: []
})

perthsucks = Ecto.Changeset.change(%Project{
    name: "perthsucks",
    display_name: "perthsucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2009-01-01 23:00:07],
    end_date: ~N[2009-01-01 23:00:07],
    tags: []
})

hobartsucks = Ecto.Changeset.change(%Project{
    name: "hobartsucks",
    display_name: "hobartsucks",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2009-01-01 23:00:07],
    end_date: ~N[2009-01-01 23:00:07],
    tags: []
})



writing_with_projects = Ecto.Changeset.put_assoc(writing, :projects, 
[juliusreadecom, medium, perspectivetheory, elegantlyattached, 
brokenheartsandfracturedsmiles, blackwhiteinkcurves, sweetcherryerotica, 
tktxtktx, inkquotes, adelaidesucks, melbournesucks, sydneysucks, perthsucks, hobartsucks])
Repo.insert!(writing_with_projects)


# Categories - YouTube

financialreality2011 = Ecto.Changeset.change(%Project{
    name: "the-financial-reality-2015-16",
    display_name: "The Financial Reality",
    excerpt: "Financial YouTube Channel.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2011-01-01 23:00:07],
    end_date: ~N[2011-01-01 23:00:07],
    tags: []
})

financialreality201213 = Ecto.Changeset.change(%Project{
    name: "the-financial-reality-2015-16",
    display_name: "The Financial Reality",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2012-01-01 23:00:07],
    end_date: ~N[2013-01-01 23:00:07],
    tags: []
})

financialreality201516 = Ecto.Changeset.change(%Project{
    name: "the-financial-reality-2015-16",
    display_name: "The Financial Reality",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2016-01-01 23:00:07],
    tags: []
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
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2012-01-01 23:00:07],
    end_date: ~N[2012-01-01 23:00:07],
    tags: []
})

drudgereportreport = Ecto.Changeset.change(%Project{
    name: "drudge-report-report",
    display_name: "The Drudge Report Report",
    excerpt: "A podcast I did summarising all the latest news stories on Zero Hedge.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2012-01-01 23:00:07],
    end_date: ~N[2013-01-01 23:00:07],
    tags: []
})

wetalkyoudie = Ecto.Changeset.change(%Project{
    name: "we-talk-you-die",
    display_name: "We Talk, You Die",
    excerpt: "A bunch of personal posts and creative writing.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2011-01-01 23:00:07],
    end_date: ~N[2011-01-01 23:00:07],
    tags: []
})



podcast_with_projects = Ecto.Changeset.put_assoc(podcast, :projects, 
[zerohedge, drudgereportreport, wetalkyoudie])
Repo.insert!(podcast_with_projects)


# Categories - Radio



dontholdback = Ecto.Changeset.change(%Project{
  name: "dont-hold-back",
  display_name: "Don't Hold Back",
  excerpt: "A Radio show, would you believe it or not!",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2012-01-01 23:00:07],
  end_date: ~N[2015-01-01 23:00:07],
  tags: []
})


thehourlywage = Ecto.Changeset.change(%Project{
  name: "the-hourly-wage",
  display_name: "The Hourly Wage",
  excerpt: "A Radio show, would you believe it or not!",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


thefaptacularonehourspecial = Ecto.Changeset.change(%Project{
  name: "the-faptacular-one-hour-special",
  display_name: "The Faptacular One Hour Special",
  excerpt: "A Radio show, would you believe it or not!",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


crack = Ecto.Changeset.change(%Project{
  name: "crack",
  display_name: "CRACK",
  excerpt: "A Radio show, would you believe it or not!",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


hiddencontrovery = Ecto.Changeset.change(%Project{
  name: "hidden-controvery",
  display_name: "Hidden Controvery",
  excerpt: "A Radio show, would you believe it or not!",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


justanothertopicalafternoon = Ecto.Changeset.change(%Project{
  name: "justanothertopicalafternoon",
  display_name: "Just Another Topical Afternoon",
  excerpt: "A Radio show, would you believe it or not!",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2009-01-01 23:00:07],
  end_date: ~N[2010-01-01 23:00:07],
  tags: []
})


radio_with_projects = Ecto.Changeset.put_assoc(radio, :projects, [
  dontholdback, thehourlywage, thefaptacularonehourspecial, crack,
  hiddencontrovery, justanothertopicalafternoon
])
Repo.insert!(radio_with_projects)






