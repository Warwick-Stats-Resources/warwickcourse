# A quarto template for University of Warwick branded course/workshop websites

This template is consistent with the University of Warwick's [brand](https://warwick.ac.uk/about/brand/), and makes it easy to make and publish websites for courses, workshops and similar.

What the template looks like as a website: <https://Warwick-Stats-Resources.github.io/warwickcourse>

An example of the template used for a full course: <https://Warwick-Stats-Resources.github.io/r-packages-2024>

The template has a home page ready to fill in key information about the course. It assumes that the course/workshop is delivered across several sessions, and that each session will have its own content page and its own set of slides (though can be simplified if only one content page/set of slides is required - see below). The slides for each session are embedded in the content page for the session, and a link is supplied to read the slides in a new window.

To ease the process of creating content pages and slides for new sessions (and linking them), there is a `create_session()` R function, details below.

The slides use the [warwickpres](https://github.com/warwick-Stats-Resources/warwickpres) extension, which is a Quarto Revealjs presentation format that is consistent with the University of Warwick's brand. The warwickpres extension can also be used for stand-alone presentations. See its [GitHub repo](https://github.com/warwick-Stats-Resources/warwickpres) and [example presentation](https://warwick-stats-resources.github.io/warwickpres) for more details.

Users of the warwickcourse template may also be interested in [warwickplots](https://warwick-stats-resources.github.io/warwickplots), nn R package with colour palettes and a ggplot2 theme that are consistent with The University of Warwick’s brand.

In addition, the website template has pages for instructions on joining, prerequisites and the schedule.

With some experience of Quarto (and/or reference to the excellent [Quarto documentation](https://quarto.org)), it is possible to alter any aspect of the website template, and the templates for the content pages and the slides, to suit your needs.

## Using the template
- In the top-right corner of this repo on GitHub, click on the green 'Use this template' button, then 'Create a new repository'. Select the owner and choose a name for the repo. (Do *not* select 'Include all branches').
- Click 'Create repository'.
- Once you have your own copy of the repo, open a project for it locally in your preferred IDE.
  - To use the R functions that come with the template, it is important that the project is self-contained. I use RStudio projects for this.

## Adapting the template
There are several files that come with the template that you will need to adapt:

- `_quarto.yml`
  - Update the website title (line 8)
  - Update the github href (line 22) to your repo
  - If you're not going to use any of `join.qmd`, `prerequisites.qmd` or `schedule.qmd`, then delete the links to them in the navbar. You'll probably want to keep `content.qmd` as that is the listing page from which to access all of the course material.
-  `index.qmd`
    - This is the homepage for the website. Update it with key details about the course/workshop.
- `join.qmd`
  - If you're keeping this, update with any details about how to join the course/workshop
- `schedule.qmd`
  - If you're keeping this, add the schedule here
- `prerequisites.qmd`
  - If your course has prerequisites, list them here
- `content.qmd`
  - This is the listings page for the course material and does **not** need to be edited, unless you wish to change the appearance of the listing. See the Quarto docs on [listing pages](https://quarto.org/docs/websites/website-listings.html) for details. 
    - If your course content only needs one page, you can delete all the YAML on this page to stop it being a listings page, and instead fill with your course content. You may find it useful to copy/adapt the contents of the `contents/00-template/index.qmd` file for this purpose.
  
You can, of course, make any other adaptations to the template to suit your needs.

## Content and slide templates

Assuming your course/workshop has several sessions, the website template provides templates you can use for each session's listing page (so it appears in the Contents tab), and for each session's slides. Before creating any new sessions, adapt the following files to suit your needs:

- `contents/00-template/index.qmd`
- `slides/00-template/index.qmd`

Note that in the contents template, there are three places where the text `UPDATE-DIR-NAME` appears. **Do not update that here!** See below.

## Creating and deleting sessions

The website template comes with R functions that will create and delete sessions.
To use them, you need the [here](https://here.r-lib.org) package installed.
To use the provided functions, first run the following in the console (assuming you're in a RStudio project for the website):

```{.r}
source("R/sessions.R")
```

Calling `create_session("session-name")` will do the following:

- create `slides/session-name`, copying `slides/00-template`
- create `content/session-name`, copying `content/00-template`
- replace all instances of `UPDATE-DIR-NAME` in `content/session-name/index.qmd` with `session-name`
  - links to slides in a new window
  - embeds slides in the content page

The content template as provided contains a to-do list of what then still needs to be done manually.

There is also a `delete_session(name)` function. It is useful for removing the example session that comes with the template:

```{.r}
delete_session("01-first-session")
```

## Publishing

- Since your website already has a repo, the easiest way to publish it is to GitHub Pages. To do this, run the following in the terminal:

  ```
  quarto publish gh-pages
  ```

- The template comes with a GitHub Action (GHA), in `.github/workflows/publish.yml`, that, once you've run the command above once, will then automatically update the published website on every push to main.

  - If you do not want that behaviour, just delete the `publish.yml` file. You can always publish manually by running `quarto publish gh-pages` again.
  - Note that the presence of this GHA in the template means that you'll get one failed and one incomplete workflow run when you first create your repo from the template: the 'Initial commit' will fail the 'Quarto Pulish' GHA, which in turn will cause the 'pages-build-deployment' to fail. However, once you've run `quarto publish gh-pages` once, the pages should build and deploy.
- For the publish GHA to work correctly subsequently, you **MUST** make sure that whenever you make a change to any of the `index.qmd` files for the slides which have code chunks in them (even if you haven't changed the code chunks themselves), you re-render and check the resulting files in `_freeze` into GitHub. If you don't, the GHA to build the site will fail.
- If you don't want to use GitHub Pages, see the quarto documentation for [other publishing options](https://quarto.org/docs/publishing/).
