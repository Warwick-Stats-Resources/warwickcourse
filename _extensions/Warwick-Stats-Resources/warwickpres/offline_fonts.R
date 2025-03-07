# When the presentation is first rendered,
# this file will be copied over from the warwickpres extension
# to the project root directory, since it is a `format-resource`.
# Running this script (with `source("offline_fonts.R")`)
# will then make the local font files available in the root directory
# so that the Warwick brand fonts will display, even when offline.
# It does this by uncommenting the `- fonts` listing in _extension.yml,
# so the the fonts directory is listed under `format-resources`.
# Note that when rendering, warnings will appear about not being able to fetch the resource.
# I'm not sure why this is happening, because the fonts seem to work fine offline.

readLines("./_extensions/Warwick-Stats-Resources/warwickpres/_extension.yml") |>
    sub("#- fonts", "- fonts", x = _) |>
    writeLines(
        "./_extensions/Warwick-Stats-Resources/warwickpres/_extension.yml"
    )
