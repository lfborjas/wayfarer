module DemoFeed
  def self.items
    [
      {
        url: "http://en.wikipedia.org/wiki/Academy_of_Music_(Philadelphia)",
        image_url: "/assets/medium/319px-Phila_AcademyofMusicl06.JPG",
        title: "Academy of Music",
        description: "Former longtime home of the Philadelphia Orchestra and current home of the Pennsylvania Ballet and the Opera Company of Philadelphia. The oldest opera house in the United States that is still used for its original purpose." ,
        thumbnail_url: "/assets/thumb/100px-Phila_AcademyofMusicl06.JPG" ,
        media_type: "photo",
        comments_url: "/demo/comments.json",
        lat: 39.948056 ,
        lng: -75.165
      },
      {
        url: "http://en.wikipedia.org/wiki/American_Philosophical_Society_Hall" ,
        image_url: "/assets/medium/295px-AmericanPhilosophicalSociety.png",
        title: "American Philosophical Society Hall",
        description: "Society founded 1743 by Benjamin Franklin. Building erected 1768. Early members included George Washington, John Adams, and Thomas Jefferson.",
        thumbnail_url: "/assets/thumb/100px-AmericanPhilosophicalSociety.png" ,
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.948889,
        lng: -75.149722
      },
      {
        url: "http://www.youtube.com/embed/4z2DtNW79sQ",
        image_url: nil,
        title: "Streets of Philadelphia",
        description: "Music video by Bruce Springsteen performing Streets Of Philadelphia. (C) 1993 Bruce Springsteen",
        thumbnail_url: "http://i1.ytimg.com/vi/4z2DtNW79sQ/hqdefault.jpg",
        media_type: "video" ,
        comments_url: "/demo/comments.json",
        lat: 39.951944,
        lng: -75.147222
      },
      {
        url: "http://en.wikipedia.org/wiki/Athenaeum_of_Philadelphia",
        image_url: "/assets/medium/339px-PhiladelphiaAthenaeum.png",
        title: "Athenaeum" ,
        description: "A special collections library founded in 1814. The building was designed in 1845 by John Notman." ,
        thumbnail_url: "/assets/thumb/100px-PhiladelphiaAthenaeum.png" ,
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.946667,
        lng: -75.151667 
      },
      {
        url: "http://en.wikipedia.org/wiki/Carpenters%27_Hall",
        image_url: "/assets/medium/214px-CarpentersHall00.jpg",
        title: "Carpenters' Hall",
        description: "The First Continental Congress met here." ,
        thumbnail_url: "/assets/thumb/100px-CarpentersHall00.jpg",
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.94805,
        lng: -75.147222
      },
      {
        url: "http://en.wikipedia.org/wiki/Edward_Drinker_Cope_House",
        image_url: "/assets/medium/164px-Edward_Drinker_Cope_Houses%2C_2100-2102_Pine_Street%2C_Philadelphia_%28Philadelphia_County%2C_Pennsylvania%29.jpg",
        title: "Edward D. Cope House",
        description: "A home of paleontologist Edward Drinker Cope, who is listed in National Academy of Science." ,
        thumbnail_url: "/assets/thumb/100px-Edward_Drinker_Cope_Houses%2C_2100-2102_Pine_Street%2C_Philadelphia_%28Philadelphia_County%2C_Pennsylvania%29.jpg",
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.946944,
        lng: -75.176667
      },
      {
        url: "http://en.wikipedia.org/wiki/Elfreth%27s_Alley_Historic_District",
        image_url: "/assets/medium/320px-Phila-elfrethsalley.jpg",
        title: "Elfreth's Alley Historic District",
        description: "The country's oldest residential neighborhood in continuous use.",
        thumbnail_url: "/assets/thumb/100px-Phila-elfrethsalley.jpg",
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.952778,
        lng:  -75.1425
      },
      {
        url: "http://en.wikipedia.org/wiki/First_Bank_of_the_United_States",
        image_url: "/assets/medium/320px-First_Bank_of_the_United_States.jpg",
        title: "First Bank of the United States",
        description: "Has association with Washington and Alexander Hamilton.",
        thumbnail_url: "/assets/thumb/100px-First_Bank_of_the_United_States.jpg" ,
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.948056,
        lng: -75.146389 
      },
      {
        url: "http://en.wikipedia.org/wiki/Insurance_Company_of_North_America_(INA)_Building",
        image_url: "/assets/medium/265px-WTP_D09_AMP_1.jpg",
        title: "Insurance Company of North America (INA) Building" ,
        description: "" ,
        thumbnail_url: "/assets/thumb/100px-WTP_D09_AMP_1.jpg" ,
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.954444,
        lng: -75.167222
      },
      {
        url: "http://en.wikipedia.org/wiki/Merchants%27_Exchange_Building_(Philadelphia)",
        image_url: "/assets/medium/320px-Philadelpia_merchant_exchange.jpg",
        title: "Merchants' Exchange Building" ,
        description: "Designed by William Strickland; part of Independence National Historical Park",
        thumbnail_url: "/assets/thumb/100px-Philadelpia_merchant_exchange.jpg",
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.947222,
        lng: -75.146111
      },
      {
        url: "http://en.wikipedia.org/wiki/Pennsylvania_Hospital",
        image_url: "/assets/medium/320px-Pennsylvania_Hospital_2007.jpg",
        title: "Pennsylvania Hospital",
        description: "Dr. Thomas Bond and Benjamin Franklin supported its development.",
        thumbnail_url: "/assets/thumb/100px-Pennsylvania_Hospital_2007.jpg",
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.944722,
        lng: -75.155833
      },
      {
        url: "http://en.wikipedia.org/wiki/Masonic_Temple_(Philadelphia,_Pennsylvania)",
        image_url: "/assets/medium/198px-Grand_Lodge_of_Pennsylvania.jpg",
        title: "Philadelphia's Masonic Temple",
        description: "",
        thumbnail_url: "/assets/thumb/100px-Grand_Lodge_of_Pennsylvania.jpg",
        media_type: "photo" ,
        comments_url: "/demo/comments.json",
        lat: 39.953611,
        lng: -75.162778
      }
    ]
  end

  def self.comments
    [
      {
        username: "chuck_testa",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Food truck ut mlkshk single-origin coffee aute helvetica",
        lat: 39.952222 , 
        lng: -75.159167
      },
      {
        username: "mcandless",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Irure  fanny pack nostrud adipisicing, sint  marfa four loko american apparel ex lo-fi nisi you probably haven't heard of them",
        lat: 39.9475 , 
        lng: -75.154444
      },
      {
        username: "louie",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Viral hoodie twee jean shorts minim.  Nisi biodiesel 8-bit, do vice esse  lo-fi keytar dreamcatcher tofu next level brunch",
        lat: 39.948889 , 
        lng: -75.168611
      },
      {
        username: "janis",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Artisan american apparel quinoa placeat.  Lomo consequat helvetica american apparel aute  twee",
        lat: 39.943056 , 
        lng: -75.147778
      },
      {
        username: "pyotr",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Irure  tempor locavore, aliquip +1 readymade VHS.<\\/p>\\n<p>Irure  biodiesel banksy, etsy duis  nulla  sed incididunt organic odio ut VHS brooklyn",
        lat: 39.948611 , 
        lng: -75.148333
      },
      {
        username: "loewe",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Keytar Austin nesciunt, mixtape nihil velit  etsy laboris  vegan veniam vice.  Ex vinyl four loko organic",
        lat: 39.945 , 
        lng: -75.151389
      },
      {
        username: "france_is_bacon",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Squid mustache 3 wolf moon VHS duis  aesthetic, carles lomo.  Etsy sustainable carles eu, vegan cliche biodiesel craft beer fugiat  commodo est  leggings",
        lat: 39.943333,  
        lng: -75.141111
      },
      {
        username: "claude",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Delectus veniam pitchfork consectetur, vice aliquip id  helvetica esse",
        lat: 39.943333 , 
        lng: -75.140833
      },
      {
        username: "jean",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: " Echo park banksy next level, qui  delectus jean shorts banh mi lo-fi PBR dolore four loko bicycle rights sed laboris",
        lat: 39.948333 , 
        lng: -75.155556
      },
      {
        username: "ives",
        avatar: "http://pictour.us/photos/thumb/missing.png",
        comment: "Letterpress butcher deserunt, banh mi eu  viral nostrud mollit  ex banksy dolor  leggings incididunt quinoa",
        lat: 39.951944, 
        lng: -75.162222
      }
    ]
  end
end
