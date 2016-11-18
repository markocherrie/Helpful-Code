#' image analysis in R

#' Classify image into percentage of colour

#' How many pixels?
#' How many pixels in each colour Hex Code?
#' What Hex Code correspond to "green", "blue", "brown"

# option 1: pass to API: http://mkweb.bcgsc.ca/color-summarizer/?api
# option 2: Imagemagik: http://stackoverflow.com/questions/28231419/count-how-many-pixels-with-a-specific-color-in-an-image

#install.packages("magick")

library(magick)
magick_config()

parks <- image_read('/Users/markcherrimacbook/Google Drive/Helpful-Code/park.jpg')
image_write(parks, path = "parks.png", format = "png")