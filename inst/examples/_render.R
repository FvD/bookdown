if (Sys.which('kindlegen') == '') {
  if (.Platform$OS.type == 'windows' || Sys.info()[['sysname']] == 'Darwin')
    stop('This script does not support Windows or Mac OS X')
  bookdown:::in_dir(tempdir(), {
    download.file('http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz', 'kindle.tar.gz', mode = 'wb')
    system2('tar', c('zxf', 'kindle.tar.gz'))
    dir.create('~/bin', showWarnings = FALSE)
    file.rename('kindlegen', '~/bin/kindlegen')
    if (Sys.which('kindlegen') == '')
      Sys.setenv(PATH = paste0('~/bin:', Sys.getenv('PATH')))
  })
}

formats = commandArgs(TRUE)
if (length(formats) == 0) formats = c(
  'bookdown::pdf_book', 'bookdown::epub_book', 'bookdown::gitbook'
)
# render the book to all formats unless they are specified via command-line args
for (fmt in formats) {
  res = bookdown:::Rscript(c(
    '-e', shQuote(sprintf("bookdown::render_book('index.Rmd', '%s', quiet = TRUE)", fmt))
  ))
  if (res != 0) stop('Failed to compile the book to ', fmt)
  if (fmt == 'bookdown::epub_book') bookdown::kindlegen()
}

