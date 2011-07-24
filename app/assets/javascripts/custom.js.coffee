$ ->
  # Submit form on keyup
  $("input#color").keyup ->
    $(this).closest("form").submit()
  
  # Switch swabs on click of color
  $("div.color").live "click", ->
    $("input#color").val $("p", this).text()
    $("form").submit()
  

