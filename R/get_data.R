#Store and Clean Video Data to a data frame

get_data <- function()
{videodata <- lapply(as.character(videos$video_id), get_single_video_stats)
videodata1 <- do.call(rbind,videodata)
videodata2 <- data.frame(videodata1)
videodata2$id <- unlist (videodata2$id)
videodata2$viewCount <- unlist (videodata2$viewCount)
videodata2$likeCount <- unlist (videodata2$likeCount)
videodata2$dislikeCount <- unlist (videodata2$dislikeCount)
videodata2$favoriteCount <- unlist (videodata2$favoriteCount)
videodata2$commentCount <- unlist (videodata2$commentCount)
colnames(videodata2)[1] <- "video_id"
videos2 <- videos[,c("video_id", "title", "publishedAt","date", "thumbnails.default.url","description")]
NYT_Video<- dplyr::full_join(videos2, videodata2, by = "video_id")
print(NYT_Video)}
