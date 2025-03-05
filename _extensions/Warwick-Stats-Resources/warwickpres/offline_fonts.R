path <- "./_extensions/Warwick-Stats-Resources/warwickpres/_extension.yml"
file <- readLines(path)
file <- sub("#- fonts", "- fonts", file)
writeLines(file, path)
