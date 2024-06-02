# A quarto template for University of Warwick branded course/workshop websites

**THIS DOCUMENTATION IS A WORK-IN-PROGRESS**

This template is consistent with the University of Warwick's [brand](https://warwick.ac.uk/about/brand/), and makes it easy to make and publish websites for courses, workshops and similar.

It offers...

- TEMPLATE EXAMPLE
- R PACKAGE DEV COURSE

## Using the template
- In the top-right corner of this repo on GitHub, click on the green 'Use this template' button, then 'Create a new repository'. Select the owner and choose a name for the repo. (Do *not* select 'Include all branches').
- Click 'Create repository'.
- Once you have your own copy of the repo, open a project for it locally in your preferred IDE.
  - To use the R functions that come with the template, it is important that the project is self-contained. I use RStudio projects for this.

## Adapting the template
There are several files that come with the template that you will need to adapt:

- `_quarto.yml`
  - Update the website title (line 8) and the github href (line 22)
  - If you're not going to use any of `join.qmd`, `prerequisites.qmd` or `schedule.qmd`, then delete the links to them in the navbar. You almost certainly want to keep `content.qmd` as that is the listing page from which to access all of the course material.
-  `index.qmd`
  - This is the homepage for the website. Update it with key details about the course/workshop.
- `join.qmd`
  - If you're keeping this, update with any details about how to join the course/workshop
- `schedule.qmd`
  - If you're keeping this, add the schedule here
- `prerequisites.qmd`
  - If your course has prerequisites, list them here
- `content.qmd`
  - This is the listings page for the course material and does **not** need to be edited, unless you wish to change the appearance of the listing. See QUARTO DOCS for details.
  
You can, of course, make any other adaptations to the template to suit your needs.

## Creating and deleting sessions

The template comes with R functions that will create and delete sessions.
To use them, you need the [here](https://here.r-lib.org) package installed.
To use these functions, first run the following in the console:

```{.r}

```

Calling `create_session("session-name")` will do the following.

## Publishing

- Since your website already has a repo, the easiest way to publish it is to GitHub Pages. To do this, run the following in the terminal:

  ```
  quarto publish gh-pages
  ```

- The template comes with a GitHub Action (GHA), in `.github/workflows/publish.yml`, that, once you've run the command above once, will then automatically update the published website on every push to main.

  - If you do not want that behaviour, just delete the `publish.yml` file.
  - Note that the presence of this GHA in the template means that you'll get two failed workflow runs when you first create your repo from the template: the 'Initial commit' will fail the 'Quarto Pulish' GHA, which in turn will cause the 'pages-build-deployment' to fail. However, once you run `quarto publish gh-pages` once, the pages should build and deploy.
- For the publish GHA to work correctly subsequently, you **MUST** make sure that whenever you make a change to any of the slides, you re-render and check the resulting files in `_freeze` into GitHub.
- If you don't want to use GitHub Pages, see the quarto documentaion for [other publishing options](https://quarto.org/docs/publishing/).
