library(here)

create_class <- function(name) {
  
  # new slides
  from_slides <- here("slides", "00-template")
  to_slides <- here("slides", name)

  dir.create(to_slides)
  file.copy(list.files(from_slides, full.names = TRUE),
            to_slides,
            recursive = TRUE)
  
  # new content
  from_content <- here("content", "00-template")
  to_content <- here("content", name)
  dir.create(to_content)
  file.copy(list.files(from_content, full.names = TRUE),
            to_content,
            recursive = TRUE)
  
  index <- readLines(here("content", name, "index.qmd"))
  index_new_links <- gsub("UPDATE-DIR-NAME", name, index)
  writeLines(index_new_links, here("content", name, "index.qmd"))

}

delete_class <- function(name) {
  content <- here("content", name)
  slides <- here("slides", name)
  
  unlink(content, recursive = TRUE)
  unlink(slides, recursive = TRUE)
}

