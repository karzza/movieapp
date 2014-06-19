
$ ->

  $('#searchButton').click (e) ->
    searchTerm=$('#searchField').val()
    console.log searchTerm

    masterResponse = $.ajax(
      "http://www.omdbapi.com/?s=#{searchTerm}"
      dataType:"json"
    )

    masterResponse.done (data) ->
      movies = data.Search
      for movie in movies
        imdb = movie.imdbID
        li = "<li><a href='#' data-imdbid='#{imdb}'>#{movie.Title}</a></li>"
        console.log li
        $('.movies1').append(li)

      # 1. Click 'a'
      $('a').click (e) ->
        imdbID = $(@).data('imdbid')
        # 2. Split the movie name
        movieName = $(@).html()
        # 3. Make it into array
        searchTerms = movieName.split(" ")
        # 4. For loop on each element
        for word in searchTerms
          console.log word
        # 5. Add the search terms

        # 6. Show data based on 1st search term
        # 7. Show data based on 2nd search term

        detailResponse = $.ajax(
          "http://www.omdbapi.com/?i=#{imdbID}&plot=full"
          dataType: "json"
        )
        detailResponse.done (movie) ->
          console.log movie

          poster="<img src='#{movie.Poster}'>"
          console.log poster


          $('.detail .title').html(movie.Title)
          $('.detail .poster').html(poster)
          $('.detail .year').html(movie.Year)
          $('.detail').append(movie.Plot)

