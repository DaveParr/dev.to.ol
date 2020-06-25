#' @title Create a new article locally
#' @description Make a new file with boilerplate YAML for posting to dev.to
#' @param title string of the title
#' @param description string describing the article, Default: 'a description'
#' @param series string of the series, Default: 'a series'
#' @param tags string of the YAML array of tags, Default: '['tag1', 'tag2']'
#' @param file path of the file to create, should be a "*.Rmd", Default: ''
#' @return By default the yaml boilerplate to the command line. If a file path is included it will create that file. Descriptions do not currently appear to be used in the UI, but are used by integrations, like stackbit.
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  create_new_article(title = "my title")
#'  }
#' }
#' @seealso
#'  \code{\link[glue]{glue}}
#' @rdname create_new_article
#' @export
#' @importFrom glue glue

create_new_article <-
  function(title,
           description = "a description",
           series = 'a series',
           tags = '["tag1", "tag2"]',
           file = "") {
    boilerplate_frontmatter <-
      glue::glue(
        '---\ntitle: "{title}"\ndescription: {description}\nseries: "{series}"\ntags: {tags}\noutput: github_document\n---'
      )

    cat(boilerplate_frontmatter, file = file)
  }
