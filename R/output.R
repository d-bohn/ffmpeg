
fileOutput <- function(filename, vcodec=NULL, acodec=NULL, scodec=NULL) {
    x <- list(filename=filename,
              vcodec=mapCodec(vcodec),
              acodec=mapCodec(acodec),
              scodec=mapCodec(scodec))
    class(x) <- c("FFmpeg_output_file", "FFmpeg_output")
    x
}

as.character.FFmpeg_output_file <- function(x, ...) {
    fmt <- ""
    args <- list()
    if (!is.null(x$vcodec)) {
        fmt <- paste0(fmt, "-c:v %s ")
        args <- c(args, list(x$vcodec))
    }
    if (!is.null(x$acodec)) {
        fmt <- paste0(fmt, "-c:a %s ")
        args <- c(args, list(x$acodec))
    }
    if (!is.null(x$scodec)) {
        fmt <- paste0(fmt, "-c:s %s ")
        args <- c(args, list(x$scodec))
    }
    fmt <- paste0(fmt, "%s ")
    args <- c(args, list(x$filename))
    do.call(sprintf, c(list(fmt), args))
}
