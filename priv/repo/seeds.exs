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
    description: "What companies pay me to do.",
})

writing = Ecto.Changeset.change(%Category{
    name: "writing",
    display_name: "Writing",
    description: "Delicieux, mon petit garçon.",
})

youtube = Ecto.Changeset.change(%Category{
    name: "youtube",
    display_name: "Youtube",
    description: "I wanted to become a YouTube star.",
})

podcast = Ecto.Changeset.change(%Category{
    name: "podcast",
    display_name: "Podcast",
    description: "I used to create podcasts.",
})

radio = Ecto.Changeset.change(%Category{
    name: "radio",
    display_name: "Radio",
    description: "I also wanted to work in radio.",
})


# Categories - Programming

awful_cms = Ecto.Changeset.change(%Project{
    name: "awful-cms",
    display_name: "ひどい Awful CMS",
    excerpt: "bash. unix. ubuntu.",
    description: "I would describe Awful CMS as a combination of the 8,000 billion bash scripts that 
    helps power Awful Manager to generate my collection of Awful Affiliate websites. It has scripts to 
    destroy, create and update these websites from a cache of files, both in production
    and development environments It's really cool.
    ",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "https://github.com/dottjt/awful-cms",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: [],
})

awful_manager = Ecto.Changeset.change(%Project{
    name: "awful-manager",
    display_name: "ひどい Awful Manager",
    excerpt: "elixir. phoenix. elm.",
    description: "This piece of software is an absolute beast. It is basically the GUI backend for
    Awful CMS. It allows me to update the content of all my Awful Affiliate websites from the one domain, 
    as well as easily manage production and development environments. Not to mention, 
    it's fully navigable via keyboard and does a whole heap of things!    
    ",
    featured_image: "",
    background_image: "images/cool/coolb.jpg",
    link: "https://github.com/dottjt/awful-cms",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: [],
})

awful_affiliate = Ecto.Changeset.change(%Project{
    name: "awful-affiliate",
    display_name: "ひどい Awful Affiliate",
    excerpt: "elixir. phoenix. elm.",
    description: "Awful Affiliate is the website template I use for all my affiliate websites.
    It is a fully functioning Phoenix Framework application, allowing you 
    to create products, updates, tags, categories - and whatever the hell you want. 
    ",
    featured_image: "",
    background_image: "images/cool/coolc.jpg",
    link: "https://github.com/dottjt/awful-cms",
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2018-01-01 23:00:07],
    tags: [],
})

better_image_reference = Ecto.Changeset.change(%Project{
    name: "better-image-reference",
    display_name: "より良い Better Image Reference",
    excerpt: "elixir. phoenix. elm.",
    description: "This is the first serious application I created with Elixir and Elm.
    It was going to be a very comprehensive image viewer for students learning to draw. 
    Actually, I never ended up finishing it, because I realised that it wouldn't make very much money
    (hence Awful Affiliate which I created soon after).
    ",
    featured_image: "",
    background_image: "images/cool/coold.jpg",
    link: "", #https://github.com/dottjt/BetterImageReference
    start_date: ~N[2017-01-01 23:00:07],
    end_date: ~N[2017-01-01 23:00:07],
    tags: [],
})

learning_schedule = Ecto.Changeset.change(%Project{
    name: "learning-schedule",
    display_name: "ラーニング Learning Schedule",
    excerpt: "node. react. redux.",
    description: "I had literally zero idea what I was doing - however, it does quite a lot and it was an 
    incredible learning experience.
    ",
    featured_image: "Learning Schedule was the very first full-stack application I ever built!",
    background_image: "images/cool/coole.jpg",
    link: "", #https://github.com/dottjt/LearningSchedule
    start_date: ~N[2016-01-01 23:00:07],
    end_date: ~N[2017-01-01 23:00:07],
    tags: [],
})

juliusreadev2 = Ecto.Changeset.change(%Project{
  name: "julius-reade-version-one",
  display_name: "私的な Personal Website",
  excerpt: "hugo. hugo. hugo.",
  description: "The very first version of this portfolio website. Well, it wasn't
  so much of a portfolio website, rather than a minimalist personal blog I slapped together.
  Still, I thought it looked lovely.  
  ",
  featured_image: "",
  background_image: "images/cool/coolf.jpg",
  link: "", #https://github.com/dottjt/elixirreade
  start_date: ~N[2016-01-01 23:00:07],
  end_date: ~N[2016-01-01 23:00:07],
  tags: [],
})

juliusreadev1 = Ecto.Changeset.change(%Project{
  name: "julius-reade-version-two",
  display_name: "私的な Personal Website",
  excerpt: "elixir. phoenix. elm.",
  description: "This is the website you're currently looking at. It's built with Phoenix Framework 
  (originally it was going to be with ASP.NET Core, but I believe in self-love) and 
  I think it looks nice. 
  ",
  featured_image: "",
  background_image: "images/cool/coolg.jpg",
  link: "", #https://github.com/dottjt/juliusreade
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
    display_name: "申し様 Julius Reade",
    excerpt: "words. words. words.",
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
    display_name: "ミディアム Medium",
    excerpt: "medium. medium. medium.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/cool2.jpg",
    link: "https://medium.com/@veryslowly",
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2017-01-01 23:00:07],
    tags: []
})

perspectivetheory = Ecto.Changeset.change(%Project{
    name: "perspective-theory",
    display_name: "パースペクティブ Perspective Theory",
    excerpt: "wordpress. wordpress. wordpress.",
    description: "So, I used to have a lot of mental health issues. And I thought to myself, well, if I write about them then maybe I can control them. Nup. Doesn't work one bit. As it turns out, writing and the practice of self-awareness are two very separate and different things.",
    featured_image: "",
    background_image: "images/cool/coola1.jpg",
    link: "",
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2015-01-01 23:00:07],
    tags: []
})

elegantlyattached = Ecto.Changeset.change(%Project{
    name: "elegantlyattached",
    display_name: "エレガント Elegantly Attached",
    excerpt: "tumblr. tumblr. tumblr.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola2.jpg",
    link: "https://elegantlyattached.tumblr.com", # https://elegantlyattached.tumblr.com
    start_date: ~N[2015-01-01 23:00:07],
    end_date: ~N[2015-01-01 23:00:07],
    tags: []
})

brokenheartsandfracturedsmiles = Ecto.Changeset.change(%Project{
    name: "broken-hearts-and-fractured-smiles",
    display_name: "壊れた Broken Hearts and Fractured Smiles",
    excerpt: "tumblr. tumblr. tumblr.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola3.jpg",
    link: "https://brokenheartsandfracturedsmiles.tumblr.com",
    start_date: ~N[2014-01-01 23:00:07],
    end_date: ~N[2015-01-01 23:00:07],
    tags: []
})

blackwhiteinkcurves = Ecto.Changeset.change(%Project{
    name: "black-white-ink-curves",
    display_name: "ブラック Black White Ink Curves",
    excerpt: "tumblr. tumblr. tumblr.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coola4.jpg",
    link: "https://blackwhiteinkcurvesxxx.tumblr.com",
    start_date: ~N[2014-01-01 23:00:07],
    end_date: ~N[2014-01-01 23:00:07],
    tags: []
})

sweetcherryerotica = Ecto.Changeset.change(%Project{
    name: "sweetcherryerotica",
    display_name: "甘い Sweet Cherry Erotica",
    excerpt: "tumblr. tumblr. tumblr.",
    description: "I thought it would be a good way to get girls.",
    featured_image: "",
    background_image: "images/cool/coola5.jpg",
    link: "https://sweetcherryerotica.tumblr.com",    
    start_date: ~N[2014-01-01 23:00:07],
    end_date: ~N[2014-01-01 23:00:07],
    tags: []
})

tktxtktx = Ecto.Changeset.change(%Project{
    name: "tktxtktx",
    display_name: "テキスト tktxtktx",
    excerpt: "tumblr. tumblr. tumblr.",
    description: ".",
    featured_image: "",
    background_image: "images/cool/coolb1.jpg",
    link: "https://tktxtktx.tumblr.com",        
    start_date: ~N[2013-01-01 23:00:07],
    end_date: ~N[2013-01-01 23:00:07],
    tags: []
})


inkquotes = Ecto.Changeset.change(%Project{
  name: "inkquotes",
  display_name: "インク Ink Quotes",
  excerpt: "tumblr. tumblr. tumblr.",
  description: ".",
  featured_image: "",
  background_image: "images/cool/coolb2.jpg",
  link: "https://inkquotes.tumblr.com",
  start_date: ~N[2013-01-01 23:00:07],
  end_date: ~N[2013-01-01 23:00:07],
  tags: []
})


adelaidesucks = Ecto.Changeset.change(%Project{
    name: "adelaidesucks",
    display_name: "おっぱい adelaidesucks",
    excerpt: "blogspot. blogspot. blogspot.",
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
    display_name: "おっぱい melbournesucks",
    excerpt: "blogspot. blogspot. blogspot.",
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
    display_name: "おっぱい sydneysucks",
    excerpt: "blogspot. blogspot. blogspot.",
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
    display_name: "おっぱい perthsucks",
    excerpt: "blogspot. blogspot. blogspot.",
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
    display_name: "おっぱい hobartsucks",
    excerpt: "blogspot. blogspot. blogspot.",
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
    display_name: "融通の The Financial Reality",
    excerpt: "youtube. youtube. youtube.",
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
    display_name: "融通の The Financial Reality",
    excerpt: "youtube. youtube. youtube.",
    description: "I thought I could make financial comedy work. I almost did, if it weren't for my bipolar.",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2012-01-01 23:00:07],
    end_date: ~N[2013-01-01 23:00:07],
    tags: []
})

financialreality201516 = Ecto.Changeset.change(%Project{
    name: "the-financial-reality-2015-16",
    display_name: "融通の The Financial Reality",
    excerpt: "youtube. youtube. youtube.",
    description: "I went a bit off the rails and created a bunch of videos that I think I regret.",
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
    display_name: "ゼロ The Zerohedge Daily Roundup",
    excerpt: "podcast. podcast. podcast.",
    description: "A podcast based on news from Zero Hedge. What I produced in the end was a very odd subset of sardonic, financial comedy.",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2012-01-01 23:00:07],
    end_date: ~N[2012-01-01 23:00:07],
    tags: []
})

drudgereportreport = Ecto.Changeset.change(%Project{
    name: "drudge-report-report",
    display_name: "がり勉 The Drudge Report Report",
    excerpt: "podcast. podcast. podcast.",
    description: "A podcast based on news from Drudge Report. It was a comedy podcast.",
    featured_image: "",
    background_image: "images/cool/coola.jpg",
    link: "",
    start_date: ~N[2012-01-01 23:00:07],
    end_date: ~N[2013-01-01 23:00:07],
    tags: []
})

wetalkyoudie = Ecto.Changeset.change(%Project{
    name: "we-talk-you-die",
    display_name: "トーク We Talk, You Die",
    excerpt: "podcast. podcast. podcast.",
    description: "A podcast I did with a friend. It was a comedy podcast.",
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
  display_name: "しない Don't Hold Back",
  excerpt: "radio. radio. radio.",
  description: "A radio show I did at Vision Australia Radio. It wasn't very enjoyable.",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2012-01-01 23:00:07],
  end_date: ~N[2015-01-01 23:00:07],
  tags: []
})


thefaptacularonehourspecial = Ecto.Changeset.change(%Project{
  name: "the-faptacular-one-hour-special",
  display_name: "マスをかく The Faptacular One Hour Special",
  excerpt: "radio. radio. radio.",
  description: "A comedy radio show I did with a friend.",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


crack = Ecto.Changeset.change(%Project{
  name: "crack",
  display_name: "クラック CRACK",
  excerpt: "radio. radio. radio.",
  description: "A music radio show I did with a friend.",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


hiddencontrovery = Ecto.Changeset.change(%Project{
  name: "hidden-controvery",
  display_name: "隠された Hidden Controvery",
  excerpt: "radio. radio. radio.",
  description: "I wanted to do a show about conspiracy theories. It was okay.",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


thehourlywage = Ecto.Changeset.change(%Project{
  name: "the-hourly-wage",
  display_name: "毎時 The Hourly Wage",
  excerpt: "radio. radio. radio.",
  description: "I wanted to do a radio show about finance. It was really lame.",
  featured_image: "",
  background_image: "images/cool/coola.jpg",
  link: "",
  start_date: ~N[2011-01-01 23:00:07],
  end_date: ~N[2011-01-01 23:00:07],
  tags: []
})


justanothertopicalafternoon = Ecto.Changeset.change(%Project{
  name: "justanothertopicalafternoon",
  display_name: "局所的 Just Another Topical Afternoon",
  excerpt: "radio. radio. radio.",
  description: "Back when I was 16 years old I really wanted to become a radio show host. This was the first radio show I ever did.",
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






