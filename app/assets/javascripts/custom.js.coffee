$.fn.mColorPicker.init.replace = '#color'
$.fn.mColorPicker.init.replace = false
$.fn.mColorPicker.init.enhancedSwatches = false
$.fn.mColorPicker.init.allowTransparency = false
$.fn.mColorPicker.init.showLogo = false

$ ->
  
  # Switch swabs on click of color
  $("div.color").live "click", (e) ->
    if (!$(e.target).is('p'))
      $("input#color").val $("p", this).text()
      $("form").submit()
  
  # Add jQuery ColorPicker to color field
  $("input#color").mColorPicker imageFolder: "/assets/mcolorpicker/"
  
  $("input#color").css "backgroundColor", "#f9f9f9"
  $("input#color").css "color", "#000"
  
  $("input#color").bind "colorpicked", ->
    $(this).closest("form").submit()
    
  # Submit form on keyup
  $("input#color").keyup ->
    $(this).closest("form").submit()

