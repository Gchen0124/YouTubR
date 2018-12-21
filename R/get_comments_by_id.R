#' Get comments for one video based on its video ID.
#'
#' @param x A string
#' @return All the comments on the video with video ID. of \code{x}
#' @examples
#' get_comments_by_id(SwBA1qb5ENg)

get_comments_by_id <- function(x){
  commentData <- get_all_comments(video_id = x)
  print(commentData)
}
