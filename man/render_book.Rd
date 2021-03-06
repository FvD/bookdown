% Please edit documentation in R/render.R
\name{render_book}
\alias{preview_chapter}
\alias{render_book}
\title{Render multiple R Markdown documents into a book}
\usage{
render_book(input, output_format = NULL, ..., clean = TRUE, envir = parent.frame(), 
    output_dir = "_book", new_session = FALSE, force_knit = FALSE, preview = FALSE)

preview_chapter(..., envir = parent.frame())
}
\arguments{
\item{input}{An input filename (or multiple filenames). If \code{preview =
TRUE}, only files specified in this argument are rendered, otherwise all R
Markdown files specified by the book are rendered.}

\item{output_format, ..., clean, envir}{Arguments to be passed to
\code{rmarkdown::\link[rmarkdown]{render}()}. For \code{preview_chapter()},
\code{...} is passed to \code{render_book()}.}

\item{output_dir}{The output directory. If not specified, a field named
\code{output_dir} in the configuration file \file{_bookdown.yml} will be
used (possiblely not specified, either). If not \code{NULL}, the output
files will be moved to this directory.}

\item{new_session}{Whether to use new R sessions to compile individual Rmd
files.}

\item{force_knit}{Whether to force knitting all Rmd files (this argument is
only for \code{new_session = TRUE}).}

\item{preview}{Whether to render and preview the input files specified by the
\code{input} argument. Previewing a certain chapter may save compilation
time as you actively work on this chapter, but the output may not be
accurate (e.g. cross-references to other chapters will not work).}
}
\description{
Render mulitple R Markdown files under the current working directory into a
book. It can be used in the RStudio IDE (specifically, the \code{knit} field
in YAML). The \code{preview_chapter()} function is a wrapper of
\code{render_book(preview = TRUE)}.
}
\details{
There are two ways to render a book from Rmd files. The default way
(\code{new_session = FALSE}) is to merge Rmd files into a single file and
render this file. You can also choose to render each individual Rmd file in a
new R session (\code{new_session = TRUE}). In this case, Rmd files that have
not been updated from the previous run will not be recompiled the next time
by default, and you can force compiling them by \code{force_knit = TRUE}.
}
