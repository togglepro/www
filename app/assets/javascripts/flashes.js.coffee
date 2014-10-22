hide_flashes = ->
  $("div.flashes").slideUp("slow")

$ ->

  setTimeout(hide_flashes, 3000)
