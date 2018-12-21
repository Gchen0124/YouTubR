

#' Print word cloud for comments.
#'
#' @param x A text vector.
#' @param k A number.
#' @return The wordcloud of \code{x} with words appears more than \code{k} times in \code{x}
#' @examples
#' print_word_cloud(Comments_1$textOriginal, 30)


print_word_cloud <- function(x= Comments_1$textOriginal, k=30){

  comments_text = as.character(x)

  comments_text = tibble(text = Reduce(c, comments_text)) %>%
    mutate(text = stri_trans_general(tolower(text), "Latin-ASCII"))
  remove = c("you","the","que","and","your","muito","this","that","are","for","cara",
             "from","very","like","have","voce","man","one","nao","com","with","mais",
             "was","can","uma","but","ficou","meu","really","seu","would","sua","more",
             "it's","it","is","all","i'm","mas","como","just","make","what","esse","how",
             "por","favor","sempre","time","esta","every","para","i've","tem","will",
             "you're","essa","not","faz","pelo","than","about","acho","isso",
             "way","also","aqui","been","out","say","should","when","did","mesmo",
             "minha","next","cha","pra","sei","sure","too","das","fazer","made",
             "quando","ver","cada","here","need","ter","don't","este","has","tambem",
             "una","want","ate","can't","could","dia","fiquei","num","seus","tinha","vez",
             "ainda","any","dos","even","get","must","other","sem","vai","agora","desde",
             "dessa","fez","many","most","tao","then","tudo","vou","ficaria","foi","pela",
             "see","teu","those","were")
  words = tibble(word = Reduce(c, stri_extract_all_words(comments_text$text))) %>%
    group_by(word) %>% count() %>% arrange(desc(n)) %>% filter(nchar(word) >= 3) %>%
    filter(n > k & word %in% remove == FALSE)

  set.seed(3)
  wordcloud(words$word, words$n, random.order = FALSE, random.color = TRUE,
            rot.per = 0.3, colors = 1:nrow(words))
}
