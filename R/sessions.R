create_session <- function(name) {
  
  # new slides
  from_slides <- here::here("slides", "00-template")
  to_slides <- here::here("slides", name)

  dir.create(to_slides)
  file.copy(list.files(from_slides, full.names = TRUE),
            to_slides,
            recursive = TRUE)
  
  # new content
  from_content <- here::here("content", "00-template")
  to_content <- here::here("content", name)
  dir.create(to_content)
  file.copy(list.files(from_content, full.names = TRUE),
            to_content,
            recursive = TRUE)
  
  index <- readLines(here::here("content", name, "index.qmd"))
  index_new_links <- gsub("UPDATE-DIR-NAME", name, index)
  writeLines(index_new_links, here::here("content", name, "index.qmd"))

}

delete_session <- function(name) {
  content <- here::here("content", name)
  slides <- here::here("slides", name)
  
  unlink(content, recursive = TRUE)
  unlink(slides, recursive = TRUE)
}

