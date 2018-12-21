
# Input a YouTube Channel Id
# The default value is the New York Times Youtbube channel
Input_Channel_Id <- function(x="UCqnbDFdCpuN8CMEg0VuEBqA"){
  videos = yt_search(term="",type="video", channel_id = x)
  print(videos)
  }
