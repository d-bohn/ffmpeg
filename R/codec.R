
## Map from codec names to codec specifications
mapCodec <- function(x) {
    if (is.null(x)) {
        x
    } else {
        switch(x,

               ## Audio codecs
               Vorbis=,
               vorbis="libvorbis",
               
               ## Video codecs
               vp8=,
               VP8="libvpx",
               
               ## Some codecs translate to themselves, e.g., "copy"
               x)
    }
}